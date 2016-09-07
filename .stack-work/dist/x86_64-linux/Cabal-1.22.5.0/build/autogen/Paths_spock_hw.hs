module Paths_spock_hw (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/kot/github/spock-hw/.stack-work/install/x86_64-linux/lts-6.15/7.10.3/bin"
libdir     = "/home/kot/github/spock-hw/.stack-work/install/x86_64-linux/lts-6.15/7.10.3/lib/x86_64-linux-ghc-7.10.3/spock-hw-0.1.0.0-AB1cWVphE5c7RVdqc4JFjZ"
datadir    = "/home/kot/github/spock-hw/.stack-work/install/x86_64-linux/lts-6.15/7.10.3/share/x86_64-linux-ghc-7.10.3/spock-hw-0.1.0.0"
libexecdir = "/home/kot/github/spock-hw/.stack-work/install/x86_64-linux/lts-6.15/7.10.3/libexec"
sysconfdir = "/home/kot/github/spock-hw/.stack-work/install/x86_64-linux/lts-6.15/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "spock_hw_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "spock_hw_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "spock_hw_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "spock_hw_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "spock_hw_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
