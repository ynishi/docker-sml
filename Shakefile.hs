import Development.Shake
import Development.Shake.Command
import Development.Shake.FilePath
import Development.Shake.Util

user = "ynishi"
smlVersion = "110.99.2"

main :: IO ()
main = shakeArgs shakeOptions{shakeFiles="_build"} $ do
    want [ "_build/debian.txt", "_build/ubuntu.txt" ]

    "*/*.txt" %> \out -> do
        let target = dropExtension . takeFileName $ out
        need [target </> "Dockerfile"]
        let imageName = user ++ "/docker-sml:version-" ++ smlVersion ++ "-" ++ target
        cmd_ "docker" "build" "-t" (imageName) target
        let latestImageName = user ++ "/docker-sml:latest-" ++ target
        cmd_ "docker" "tag" imageName latestImageName
        Stdout stdout <- (cmd "docker" "images" imageName)
        writeFile' out stdout

