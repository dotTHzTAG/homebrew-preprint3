# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Preprint3 < Formula
  desc "A command-line tool for managing preprints"
  homepage "https://github.com/dotTHzTAG/preprint"
  url "https://github.com/dotTHzTAG/preprint/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "58d57a2d65dbb1c8655bd96f952f3f1c2b663711189f2f58580694565fdd2942"
  license "MIT" # Please verify the actual license of your project
  depends_on "python" # Changed to generic python for latest stable version
  def install
    # Homebrew extracts the tarball into a directory like 'preprint-0.3.2'.
    # We need to change into this directory before running pip install.
    # The name of the directory is usually derived from the archive name.
    # We can find it by listing directories after extracting.
    chdir "preprint-#{version}" do
      system Formula["python"].opt_bin/"python3", "-m", "pip", "install", ".", *std_pip_args
    end
    # Corrected executable name
    bin.install "preprint"
  end
  test do
    # `test do` will execute in a temporary directory
    # Run the `preprint` command with a dummy argument to check if it executes
    # Replace "version" with an actual subcommand or argument that prints output
    assert_match "preprint", shell_output("#{bin}/preprint --version")
  end
end