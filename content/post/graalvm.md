---
title: "Graalvm"
description:
slug: graalvm
date: 2023-08-12T13:27:10+08:00
lastmod: 2024-12-07T13:39:53+08:00
categories:
- java
tags:
- jvm
- graalvm
image:
math: false
toc: true
comments: false
license:
keywords:
- jvm
- graalvm
style:
hidden: false
draft: true
config:
  markup:
    goldmark:
      renderer:
        unsafe: true
---

```bash
docker pull ghcr.dockerproxy.com/graalvm/jdk-community:17
docker pull ghcr.io/graalvm/jdk-community:17
docker pull ghcr.dockerproxy.com/graalvm/native-image-community:17
docker pull ghcr.io/graalvm/native-image-community:17

docker run \
  --rm -it \
  -v ~:/root \
  -v $(pwd):/app \
  --entrypoint bash \
  ghcr.io/graalvm/jdk-community:21

docker run \
  --rm -it \
  -v ~:/root \
  -v $(pwd):/app \
  --entrypoint bash \
  ghcr.io/graalvm/native-image-community:21

docker run \
  --rm -it \
  -v ~:/root \
  -v $(pwd):/app \
  -w /app \
  --entrypoint /app/gradlew \
  ghcr.io/graalvm/native-image-community:21 \
  nativeCompile

docker run \
  --rm -it \
  -v ~:/root \
  -v $(pwd):/app \
  -w /app \
  --entrypoint /app/mvnw \
  ghcr.io/graalvm/native-image-community:21 \
  native:compile -Pnative

# rpm -i findutils-4.8.0-5.el9.x86_64.rpm

# SPRING_MAIN_BANNER_MODE=off ./demo
```

```bash
# https://maven.apache.org/settings.html

mkdir -p ~/.m2
tee ~/.m2/settings.xml <<EOF >/dev/null
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 https://maven.apache.org/xsd/settings-1.0.0.xsd">
  <localRepository/>
  <interactiveMode/>
  <offline/>
  <pluginGroups/>
  <servers/>
  <mirrors>
    <mirror>
      <id>aliyuncentral</id>
      <mirrorOf>central</mirrorOf>
      <name>阿里云公共仓库</name>
      <url>https://maven.aliyun.com/repository/central</url>
    </mirror>
    <mirror>
      <id>aliyungoogle</id>
      <mirrorOf>https://maven.google.com</mirrorOf>
      <name>阿里云Google公共仓库</name>
      <url>https://maven.aliyun.com/repository/google</url>
    </mirror>
  </mirrors>
  <proxies/>
  <profiles>
    <profile>
      <repositories>
        <repository>
          <id>central</id>
          <url>https://maven.aliyun.com/repository/central</url>
          <releases>
            <enabled>true</enabled>
          </releases>
          <snapshots>
            <enabled>true</enabled>
          </snapshots>
        </repository>
        <repository>
            <id>spring</id>
            <url>https://maven.aliyun.com/repository/spring</url>
            <releases>
                <enabled>true</enabled>
            </releases>
            <snapshots>
                <enabled>true</enabled>
            </snapshots>
        </repository>
        <repository>
            <id>gradle-plugin</id>
            <url>https://maven.aliyun.com/repository/gradle-plugin</url>
            <!-- <url>https://plugins.gradle.org/m2</url> -->
        </repository>
        <repository>
            <id>jitpack.io</id>
            <url>https://jitpack.io</url>
        </repository>
      </repositories>
    </profile>
  </profiles>
  <activeProfiles/>
</settings>
EOF

```

```bash
# https://docs.gradle.org/current/userguide/build_environment.html#sec:gradle_configuration_properties
# https://docs.gradle.org/current/userguide/init_scripts.html
gradle_user_home=${GRADLE_USER_HOME:-"${HOME}/.gradle"}
mkdir -p ${gradle_user_home}/init.d/

touch ${gradle_user_home}/gradle.properties

tee ${gradle_user_home}/init.d/init.gradle <<EOF >/dev/null
allprojects {
  repositories {
    def ALIYUN_REPOSITORY_URL = 'https://maven.aliyun.com/repository/public'
    def ALIYUN_JCENTER_URL = 'https://maven.aliyun.com/repository/public'
    def ALIYUN_GOOGLE_URL = 'https://maven.aliyun.com/repository/google'
    def ALIYUN_GRADLE_PLUGIN_URL = 'https://maven.aliyun.com/repository/gradle-plugin'
    all { ArtifactRepository repo ->
      if(repo instanceof MavenArtifactRepository){
        def url = repo.url.toString()
        if (url.startsWith('https://repo1.maven.org/maven2/')) {
          project.logger.lifecycle "Repository \${repo.url} replaced by \$ALIYUN_REPOSITORY_URL."
          remove repo
        }
        if (url.startsWith('https://jcenter.bintray.com/')) {
          project.logger.lifecycle "Repository \${repo.url} replaced by \$ALIYUN_JCENTER_URL."
          remove repo
        }
        if (url.startsWith('https://dl.google.com/dl/android/maven2/')) {
          project.logger.lifecycle "Repository \${repo.url} replaced by \$ALIYUN_GOOGLE_URL."
          remove repo
        }
        if (url.startsWith('https://plugins.gradle.org/m2/')) {
          project.logger.lifecycle "Repository \${repo.url} replaced by \$ALIYUN_GRADLE_PLUGIN_URL."
          remove repo
        }
      }
    }
    maven { url ALIYUN_REPOSITORY_URL }
    maven { url ALIYUN_JCENTER_URL }
    maven { url ALIYUN_GOOGLE_URL }
    maven { url ALIYUN_GRADLE_PLUGIN_URL }
  }
}
buildscript {
  repositories {
    def ALIYUN_REPOSITORY_URL = 'https://maven.aliyun.com/repository/public'
    def ALIYUN_JCENTER_URL = 'https://maven.aliyun.com/repository/public'
    def ALIYUN_GOOGLE_URL = 'https://maven.aliyun.com/repository/google'
    def ALIYUN_GRADLE_PLUGIN_URL = 'https://maven.aliyun.com/repository/gradle-plugin'
    all { ArtifactRepository repo ->
      if(repo instanceof MavenArtifactRepository){
        def url = repo.url.toString()
        if (url.startsWith('https://repo1.maven.org/maven2/')) {
          project.logger.lifecycle "Repository \${repo.url} replaced by \$ALIYUN_REPOSITORY_URL."
          remove repo
        }
        if (url.startsWith('https://jcenter.bintray.com/')) {
          project.logger.lifecycle "Repository \${repo.url} replaced by \$ALIYUN_JCENTER_URL."
          remove repo
        }
        if (url.startsWith('https://dl.google.com/dl/android/maven2/')) {
          project.logger.lifecycle "Repository \${repo.url} replaced by \$ALIYUN_GOOGLE_URL."
          remove repo
        }
        if (url.startsWith('https://plugins.gradle.org/m2/')) {
          project.logger.lifecycle "Repository \${repo.url} replaced by \$ALIYUN_GRADLE_PLUGIN_URL."
          remove repo
        }
      }
    }
    maven { url ALIYUN_REPOSITORY_URL }
    maven { url ALIYUN_JCENTER_URL }
    maven { url ALIYUN_GOOGLE_URL }
    maven { url ALIYUN_GRADLE_PLUGIN_URL }
  }
}
EOF

tee ${gradle_user_home}/init.d/init.gradle <<EOF >/dev/null
buildscript {
    repositories {
      maven { url 'https://maven.aliyun.com/repository/public/' }
      maven { url 'https://maven.aliyun.com/repository/spring/'}
      maven { url 'https://maven.aliyun.com/repository/google/' }
      maven { url 'https://maven.aliyun.com/repository/gradle-plugin/' }
    }
}

allprojects {
    repositories {
      maven { url 'https://maven.aliyun.com/repository/public/' }
      maven { url 'https://maven.aliyun.com/repository/spring/'}
      maven { url 'https://maven.aliyun.com/repository/google/' }
      maven { url 'https://maven.aliyun.com/repository/gradle-plugin/' }
    }
}
EOF
```

| 仓库名        | 简介                            | 实际地址                                | 使用地址                                                          |
| ------------- | ------------------------------- | --------------------------------------- | ----------------------------------------------------------------- |
| jcenter       | JFrog公司提供的仓库             | http://jcenter.bintray.com              | https://maven.aliyun.com/repository/jcenter                       |
|               |                                 |                                         | https://maven.aliyun.com/nexus/content/repositories/jcenter       |
| mavenLocal    | 本台电脑上的仓库                | `${USER_HOME}/.m2/repository`           | `%USERPROFILE%/.m2/repository` (Windows)                          |
|               |                                 |                                         | `${HOME}/.m2/repository` (Linux)                                  |
| mavenCentral  | Sonatype公司提供的中央库        | http://central.maven.org/maven2         | https://maven.aliyun.com/repository/central                       |
|               |                                 |                                         | https://maven.aliyun.com/nexus/content/repositories/central       |
| google        | Google公司提供的仓库            | https://maven.google.com                | https://maven.aliyun.com/repository/google                        |
|               |                                 |                                         | https://maven.aliyun.com/nexus/content/repositories/google        |
|               |                                 |                                         | https://dl.google.com/dl/android/maven2                           |
| jitpack       | JitPack提供的仓库               | https://jitpack.io                      | https://jitpack.io                                                |
| public        | jcenter和mavenCentral的聚合仓库 |                                         | https://maven.aliyun.com/repository/public                        |
|               |                                 |                                         | https://maven.aliyun.com/nexus/content/groups/public              |
| gradle-plugin | Gradle插件仓库                  | https://plugins.gradle.org/m2           | https://maven.aliyun.com/repository/gradle-plugin                 |
| gradle-plugin | Gradle插件仓库                  | https://plugins.gradle.org/m2           | https://maven.aliyun.com/nexus/content/repositories/gradle-plugin |
| spring        | Spring仓库                      | https://repo.spring.io/milestone/       | https://maven.aliyun.com/repository/spring                        |
| spring-plugin | Spring插件仓库                  | https://repo.spring.io/plugins-release/ | https://maven.aliyun.com/repository/spring-plugin                 |

> [Maven Repository: Repositories](https://mvnrepository.com/repos)

## GraalVM Native Support

This project has been configured to let you generate either a lightweight container or a native executable.
It is also possible to run your tests in a native image.

### Lightweight Container with Cloud Native Buildpacks

If you're already familiar with Spring Boot container images support, this is the easiest way to get started.
Docker should be installed and configured on your machine prior to creating the image.

To create the image, run the following goal:

```
$ ./gradlew bootBuildImage
```

Then, you can run the app like any other container:

```
$ docker run --rm demo:0.0.1-SNAPSHOT
```

### Executable with Native Build Tools

Use this option if you want to explore more options such as running your tests in a native image.
The GraalVM `native-image` compiler should be installed and configured on your machine.

NOTE: GraalVM 22.3+ is required.

To create the executable, run the following goal:

```
$ ./gradlew nativeCompile
```

Then, you can run the app as follows:
```
$ build/native/nativeCompile/demo
```

You can also run your existing tests suite in a native image.
This is an efficient way to validate the compatibility of your application.

To run your existing tests in a native image, run the following goal:

```
$ ./gradlew nativeTest
```

### Lightweight Container with Cloud Native Buildpacks

If you're already familiar with Spring Boot container images support, this is the easiest way to get started.
Docker should be installed and configured on your machine prior to creating the image.

To create the image, run the following goal:

```
$ ./mvnw spring-boot:build-image -Pnative
```

Then, you can run the app like any other container:

```
$ docker run --rm maven-demo:0.0.1-SNAPSHOT
```

### Executable with Native Build Tools

Use this option if you want to explore more options such as running your tests in a native image.
The GraalVM `native-image` compiler should be installed and configured on your machine.

NOTE: GraalVM 22.3+ is required.

To create the executable, run the following goal:

```
$ ./mvnw native:compile -Pnative
```

Then, you can run the app as follows:
```
$ target/maven-demo
```

You can also run your existing tests suite in a native image.
This is an efficient way to validate the compatibility of your application.

To run your existing tests in a native image, run the following goal:

```
$ ./mvnw test -PnativeTest
```

