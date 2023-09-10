# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
# 这里首字母需要大写
class AzureCli < Formula
  desc "BLAKE2 b2sum reference binary"
  homepage "https://github.com/BLAKE2/BLAKE2"
  url "https://github.com/BLAKE2/BLAKE2/archive/20190724.tar.gz"
  sha256 "7f2c72859d462d604ab3c9b568c03e97b50a4052092205ad18733d254070ddc2"
  license "CC0-1.0"
  head "https://github.com/redis/redis.git", branch: "unstable"

  # 需要卸载的冲突包
  conflicts_with "coreutils", because: "both install `b2sum` binaries"

  livecheck do
    url "https://download.redis.io/releases/"
    regex(/href=.*?redis[._-]v?(\d+(?:\.\d+)+)\.t/i)
    skip
  end

  depends_on "node"
  depends_on "autoconf" => :build
  depends_on xcode: :build
  depends_on macos: :catalina

  keg_only :shadowed_by_macos
  fails_with gcc: "5"

  uses_from_macos "xz" => :build

  # 补丁
  patch do
    url "https://raw.githubusercontent.com/Homebrew/formula-patches/03cf8088210822aa2c1ab544ed58ea04c897d9c4/libtool/configure-pre-0.4.2.418-big_sur.diff"
    sha256 "83af02f2aa2b746bb7225872cab29a253264be49db0ecebb12f841562d9a2923"
  end

  # 定义安装过程
  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    cd "b2sum" do
      system "make", "NO_OPENMP=1"
      system "make", "install", "PREFIX=#{prefix}", "MANDIR=#{man}"
    end
    system "make", "install", "PREFIX=#{prefix}", "CC=#{ENV.cc}", "BUILD_TLS=yes"

    # 似乎是依赖
    openssl = Formula["openssl@1.1"]
    %w[run db/redis log].each { |p| (var/p).mkpath }

    # Fix up default conf file to match our paths
    # 字符替换
    inreplace "redis.conf" do |s|
      s.gsub! "/var/run/redis.pid", var/"run/redis.pid"
      s.gsub! "dir ./", "dir #{var}/db/redis/"
      s.sub!(/^bind .*$/, "bind 127.0.0.1 ::1")
    end

    etc.install "redis.conf"
    # 重命名 etc 目录 配置文件
    etc.install "sentinel.conf" => "redis-sentinel.conf"

    # 重命名二进制文件
    # 安装所有文件
    bin.install Dir["*"]
    bin.install "doggo-api.bin" => "doggo-api"

    # 编译前的准备
    system "./configure", *args
    # 加载 include 目录
    cc_opt = "-I#{pcre.opt_include} -I#{openssl.opt_include}"
    # 加载 lib 目录
    ld_opt = "-L#{pcre.opt_lib} -L#{openssl.opt_lib}"
  end

  # 安装前的准备
  def post_install
    (var/"run").mkpath
    (var/"log").mkpath
    conf_warn = <<~EOS
      The default location for supervisor's config file is now:
        #{etc}/supervisord.conf
      Please move your config file to this location and restart supervisor.
    EOS
    old_conf = etc/"supervisord.ini"
    opoo conf_warn if old_conf.exist?
  end

  # 似乎是安装过程中给出的提示
  def caveats
    on_macos do
      <<~EOS
        For the system Java wrappers to find this JDK, symlink it with
          sudo ln -sfn #{opt_libexec}/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
      EOS
    end
  end

  service do
    run [opt_bin/"redis-server", etc/"redis.conf"]
    keep_alive true
    error_log_path var/"log/redis.log"
    log_path var/"log/redis.log"
    working_dir var
  end

  service do
    if OS.linux?
      run [opt_bin/"nginx", "-g", "'daemon off;'"]
    else
      run [opt_bin/"nginx", "-g", "daemon off;"]
    end
    keep_alive false
    working_dir HOMEBREW_PREFIX
  end

  # 定义测试过程
  test do
    checksum = <<~EOS
      ba80a53f981c4d0d6a2797b69f12f6e94c212f14685ac4b74b12bb6fdbffa2d17d87c5392
      aab792dc252d5de4533cc9518d38aa8dbf1925ab92386edd4009923  -
    EOS
    assert_equal checksum.delete!("\n"),
                 pipe_output("#{bin}/b2sum -", "abc").chomp
  end
  
  test do

    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test doggo`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"

    # 创建测试配置文件
    (testpath/"sd.ini").write <<~EOS
      [unix_http_server]
      file=supervisor.sock

      [supervisord]
      loglevel=debug

      [rpcinterface:supervisor]
      supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

      [supervisorctl]
      serverurl=unix://supervisor.sock
    EOS

    begin
      pid = fork { exec bin/"supervisord", "--nodaemon", "-c", "sd.ini" }
      sleep 1
      output = shell_output("#{bin}/supervisorctl -c sd.ini version")
      assert_match version.to_s, output
    ensure
      Process.kill "TERM", pid
    end
  end

end
