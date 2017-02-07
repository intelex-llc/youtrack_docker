# YouTrack on Docker

This repository contains a Docker image of JetBrains [YouTrack](http://www.jetbrains.com/youtrack).

## Usage

Build:

```sh
    docker build -t youtrack_img .
```

Run:

```sh
    docker run --name youtrack_app --restart always -v /home/$USER/teamsysdata:/root/teamsysdata -v /home/$USER/teamsysdata-backup:/root/teamsysdata-backup -p 8112:8112 -d youtrack_img
```
