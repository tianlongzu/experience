# BitLoop Client TestNet Review and QA

## TOC

- [BitLoop Client TestNet Review and QA](#bitloop-client-testnet-review-and-qa)
    - [TOC](#toc)
    - [1. 模块级别 Code Review](#1-%E6%A8%A1%E5%9D%97%E7%BA%A7%E5%88%AB-code-review)
        - [人员](#%E4%BA%BA%E5%91%98)
            - [Review panel](#review-panel)
            - [模块分工](#%E6%A8%A1%E5%9D%97%E5%88%86%E5%B7%A5)
        - [各模块报告会议](#%E5%90%84%E6%A8%A1%E5%9D%97%E6%8A%A5%E5%91%8A%E4%BC%9A%E8%AE%AE)
        - [Review Panel整理工作](#review-panel%E6%95%B4%E7%90%86%E5%B7%A5%E4%BD%9C)
    - [2. 包管理工具](#2-%E5%8C%85%E7%AE%A1%E7%90%86%E5%B7%A5%E5%85%B7)
        - [需求调研和选型](#%E9%9C%80%E6%B1%82%E8%B0%83%E7%A0%94%E5%92%8C%E9%80%89%E5%9E%8B)
        - [Git Submodule](#git-submodule)
        - [其它](#%E5%85%B6%E5%AE%83)
        - [包管理培训](#%E5%8C%85%E7%AE%A1%E7%90%86%E5%9F%B9%E8%AE%AD)
    - [3. 模块修改/开发](#3-%E6%A8%A1%E5%9D%97%E4%BF%AE%E6%94%B9%E5%BC%80%E5%8F%91)
        - [`config`模块](#config%E6%A8%A1%E5%9D%97)
            - [需求](#%E9%9C%80%E6%B1%82)
                - [命名](#%E5%91%BD%E5%90%8D)
                - [覆盖关系](#%E8%A6%86%E7%9B%96%E5%85%B3%E7%B3%BB)
            - [实现](#%E5%AE%9E%E7%8E%B0)
            - [测试](#%E6%B5%8B%E8%AF%95)
        - [`CLI`模块](#cli%E6%A8%A1%E5%9D%97)
            - [设计](#%E8%AE%BE%E8%AE%A1)
            - [可能需要的功能简述](#%E5%8F%AF%E8%83%BD%E9%9C%80%E8%A6%81%E7%9A%84%E5%8A%9F%E8%83%BD%E7%AE%80%E8%BF%B0)
            - [CLI测试](#cli%E6%B5%8B%E8%AF%95)
        - [`plot`模块对接重做](#plot%E6%A8%A1%E5%9D%97%E5%AF%B9%E6%8E%A5%E9%87%8D%E5%81%9A)
        - [`log`模块和`log`监控系统](#log%E6%A8%A1%E5%9D%97%E5%92%8Clog%E7%9B%91%E6%8E%A7%E7%B3%BB%E7%BB%9F)
    - [4. 开发工具修改/开发](#4-%E5%BC%80%E5%8F%91%E5%B7%A5%E5%85%B7%E4%BF%AE%E6%94%B9%E5%BC%80%E5%8F%91)
        - [`test`模块](#test%E6%A8%A1%E5%9D%97)
            - [选型](#%E9%80%89%E5%9E%8B)
        - [`vet/lint`模块](#vetlint%E6%A8%A1%E5%9D%97)
        - [`makefile`模块](#makefile%E6%A8%A1%E5%9D%97)
            - [选型](#%E9%80%89%E5%9E%8B-1)
            - [命令](#%E5%91%BD%E4%BB%A4)
            - [`make`](#make)
                - [`make install`](#make-install)
                - [`make dev`](#make-dev)
                - [`make test`](#make-test)
                - [`make fulltest`](#make-fulltest)
                - [`make build`](#make-build)
    - [5. 根文件处理](#5-%E6%A0%B9%E6%96%87%E4%BB%B6%E5%A4%84%E7%90%86)
        - [`README.md`](#readmemd)
        - [`.gitignore`](#gitignore)
        - [`default.conf`和`custom.conf`](#defaultconf%E5%92%8Ccustomconf)
        - [`Makefile`](#makefile)
        - [`LICENSE`](#license)
        - [`CHANGELOG`](#changelog)
        - [`Dockerfile`](#dockerfile)
            - [输入和输出](#%E8%BE%93%E5%85%A5%E5%92%8C%E8%BE%93%E5%87%BA)
            - [目标](#%E7%9B%AE%E6%A0%87)
        - [`Jenkinsfile`](#jenkinsfile)
    - [6. 总体重命名为`bitloop-client`](#6-%E6%80%BB%E4%BD%93%E9%87%8D%E5%91%BD%E5%90%8D%E4%B8%BAbitloop-client)
    - [7. CI/CD流程](#7-cicd%E6%B5%81%E7%A8%8B)
        - [提交和构建](#%E6%8F%90%E4%BA%A4%E5%92%8C%E6%9E%84%E5%BB%BA)
        - [测试/分析/构建报告](#%E6%B5%8B%E8%AF%95%E5%88%86%E6%9E%90%E6%9E%84%E5%BB%BA%E6%8A%A5%E5%91%8A)
        - [产品/版本发布](#%E4%BA%A7%E5%93%81%E7%89%88%E6%9C%AC%E5%8F%91%E5%B8%83)
    - [8. 新测试](#8-%E6%96%B0%E6%B5%8B%E8%AF%95)
        - [复杂网络共识测试](#%E5%A4%8D%E6%9D%82%E7%BD%91%E7%BB%9C%E5%85%B1%E8%AF%86%E6%B5%8B%E8%AF%95)
        - [流程测试](#%E6%B5%81%E7%A8%8B%E6%B5%8B%E8%AF%95)
        - [交易，惩罚交易，抵押交易](#%E4%BA%A4%E6%98%93%E6%83%A9%E7%BD%9A%E4%BA%A4%E6%98%93%E6%8A%B5%E6%8A%BC%E4%BA%A4%E6%98%93)
        - [经济机制仿真](#%E7%BB%8F%E6%B5%8E%E6%9C%BA%E5%88%B6%E4%BB%BF%E7%9C%9F)
        - [大容量测试](#%E5%A4%A7%E5%AE%B9%E9%87%8F%E6%B5%8B%E8%AF%95)
    - [9. 开发规范培训](#9-%E5%BC%80%E5%8F%91%E8%A7%84%E8%8C%83%E5%9F%B9%E8%AE%AD)
        - [模块整理工作](#%E6%A8%A1%E5%9D%97%E6%95%B4%E7%90%86%E5%B7%A5%E4%BD%9C)

## 1. 模块级别 Code Review

### 人员

#### Review panel

| Elon | 郜策宇 | 唐守信 | 韩锐 | 李安然 |
| ---- | ------ | ------ | ---- | ------ |

#### 模块分工

TODO:完成模块分工

| 模块简写 | 模块说明 | 主要负责人 | 次要负责人 | 预期需要时间(1-5) |
| -------- | -------- | ---------- | ---------- | ----------------- |

### 各模块报告会议

* 讲清内部依赖
  * 流程图
    * 大的组件流程图
    * 不做UML图
  * 输入输出/调用关系
* 讲清配置/常量依赖
  * 整理配置列表，应包含，
  * 现有的配置依赖，即对`config`的依赖
  * 应独立而尚未独立的配置
* 讲清代码组成
  * 文件构成
  * //函数构成
  * //变量和常量构成
  * 静态代码文件、运行生成文件、工具链文件
  * 需要从模块源代码中`ignore`的文件
* 讲清外部依赖关系
  * 包依赖，即对`vendor`目录的依赖
  * 服务依赖，(策略模型)，即对`sqlite`，`leveldb`等需要另行安装的程序/服务的依赖
  * 静态依赖，即对`.so`，`.dll`等外包已编译的静态链接库的依赖
* 讲清单元测试
  * 单元测试总体情况
  * 单元测试覆盖率
  * 单元测试规范程度
* 参与问题讨论
  * 面临的模块问题和架构问题
  * 增加新功能时是否顺畅？
  * 可能的模块内重构和设计模式修改
  * 报告代码冗余度：文档
  * 安全性考虑
    * 代码安全性(静态安全，类型安全)
    * 业务安全性(运行安全，业务逻辑安全)
    * 黑盒安全性(封装安全，外部调用安全，黑盒攻击安全)
  * 各自模块内`README.md`应该写什么

### Review Panel整理工作

* 总体依赖关系整理
* 兼容性需求整理
  * 使用兼容性
  * 开发兼容性
  * 周边兼容性
* 现有代码关键风险识别
* 识别必要的架构调整
* 工作优先级整理
* 提供开发规范建议
  * 代码风格规范
  * 提交流程规范
  * 分支合并规范

## 2. 包管理工具

### 需求调研和选型

* 列出需要管理的包
  * 列出运行程序必须的包
  * 列出进行开发必须的包
  * 及早提供给DevOps研究网络可靠性
* 建议选型[Dep](https://github.com/golang/dep)
* 需要调研Go本身的包管理工具

### Git Submodule

评估是否使用`Git Submodule`，如不使用，找出替代的跨源代码依赖解决方案。

### 其它

* 开发者盲测/试用
* 跨平台测试

### 包管理培训

* 包管理用法，递归用法
* 完成`README.md`的包管理使用部分(`make install`)

## 3. 模块修改/开发

### `config`模块

#### 需求

##### 命名

* 应选用同时兼容以下配置方式传入的命名法
  * 命令行参数 `command line arguments / FLAGs`
  * 环境变量 `environment variables`
  * `config`文件
* 整理并全部重新命名配置项目
* Review配置项目名称
* 编写`config`表，需要考虑以下列：
  * 名称和功能说明
  * 是否可以为空`required`，默认值`default`
  * 依赖关系/有效性前提
* 考虑暂时隐藏/固定不常用`config`项目

##### 覆盖关系

命令行参数 >> 环境变量 >> `custom.conf` >> `default.conf`

#### 实现

* 实现各`config`项目功能
* 实现`config`读取和覆盖关系处理
* 完成`default.conf`的撰写和注释(双语)
* 设计和实现`config`静态检查器
  * 设计`validator`
  * 进行错误返回
  * 整合错误日志
* 完成`README.md`相关章节的初稿

#### 测试

* 单元测试
* 部署测试
  * Docker环境变量部署测试
  * Docker`config`文件替换部署测试
  * Docker`CLI FLAG`部署测试
* 运行测试

### `CLI`模块

#### 设计

* 参数和接口设计
* 重构
  * 分析原`CLI`模块处理方式
  * 实现新`CLI`框架和帮助内容输出
  * 实现具体功能
  * 实现参数检查，与具体功能模块对接
  * 隐藏尚未实现的功能
* `-c`输入与`config`模块对接

#### 可能需要的功能简述

| 主参数         | 子参数         | 说明                                                                                 | 样例                                  |
| -------------- | -------------- | ------------------------------------------------------------------------------------ | ------------------------------------- |
| `-m`, `--mine` |                | 开始/继续挖矿，如未进行Plot则提示用户先Plot，并退出。                                | `--mine`                              |
| `-p`, `--plot` |                | Plot一块空间再开始挖矿，如已Plot完成则提示并退出，默认`--bitlength=32`               | `--plot`                              |
|                | `--bitlength`  | 规定Plot的空间大小                                                                   | `--plot --bitlength=36`               |
|                | `--plot-only`  | Plot完成即退出，不开始挖矿                                                           | `--plot --plot-only`                  |
|                | `--calculator` | 规定Plot计算时使用的硬件，默认`auto`，可强制指定为`cpu`或`gpu-nvidia`或`gpu-general` | `--plot --calculator=cpu`             |
| `-h`, `--help` |                | 显示命令行参数帮助信息。                                                             |
| `-c`, `--conf` |                | 规定自定义配置文件路径。                                                             | `--conf=./custom.conf` 此项也是默认值 |
| `-e`, `--env`  |                | 从命令行直接修改配置单项，可以多次使用，一些常见配置的修改可以通过此命令调用覆盖。   | `--env BLOCKCHAIN_ID=TestNet`         |

TODO:完成此项。包括`verbose`，`log`等。

#### CLI测试

* 跨平台运行测试
* Docker部署测试

### `plot`模块对接重做

* 测试静态链接调用
* 重写模块
* `1T Plot`测试
* 设计跨语言源代码整合/依赖/编译

### `log`模块和`log`监控系统

## 4. 开发工具修改/开发

### `test`模块

#### 选型

* 预计使用原生`go test`
* 需要考虑原生`test coverage`实现方法
* Clear当前问题

### `vet/lint`模块

TODO:设计和优化完整的本地和build-time的lint方案，已安排张初步研究。

### `makefile`模块  

#### 选型

* 是否选用`makefile`
* 选用`makefile`做外层，还是做全部
* 需要支持的操作系统/平台
* 跨平台测试

#### 命令

* 错误检查
* gofmt
* go vet
* go test (包含 test coverage)
* 建议考虑`gometalint`工具

#### `make`

* 考虑试用`make for windows`，`cygwin`解决跨平台问题

##### `make install`

安装项目**编译**的必须工具。

##### `make dev`

安装项目**开发**的必须工具。

##### `make test`

进行本地代码检查和测试。提交前必须进行。运行前提是完成`make dev`。

##### `make fulltest`

进行服务器端，配置完整的代码检查、测试、报告。可能被Jenkin调用。运行前提是完成`make dev`。

##### `make build`

编译/构建二进制项目代码。

## 5. 根文件处理

### `README.md`

### `.gitignore`

* 根目录：注释清晰
* 子目录：一级子目录内必须有该文件

### `default.conf`和`custom.conf`

* 必须包含注释
* `custom.conf`文件非必须，应从源代码`ignore`
* 注释未来会成为`README.md`或文档的一部分

### `Makefile`

* 参见上文`makefile`模块

### `LICENSE`

建议使用GNU LGPL v3.0。

### `CHANGELOG`

建议保持空文件，从TestNet上线开始维护。

### `Dockerfile`

#### 输入和输出

#### 目标

### `Jenkinsfile`

TODO:已安排陈研究

## 6. 总体重命名为`bitloop-client`

* 建议在测试功能正常运行，单元测试覆盖率提高后进行。
* 重命名需要考虑`github.com`路径。相关名称应该写成`bitloop-org/bitloop-client`。
* 重命名完成后需要调整CI/CD。
* 重命名完成后需要进行大规模测试。

## 7. CI/CD流程

### 提交和构建

### 测试/分析/构建报告

### 产品/版本发布

## 8. 新测试

### 复杂网络共识测试

### 流程测试

**测试工具**

### 交易，惩罚交易，抵押交易

**测试脚本**

### 经济机制仿真

### 大容量测试

## 9. 开发规范培训

### 模块整理工作

* `git-flow`和分支规范
* `README.md`的撰写
* `make test`的使用
* 单元测试方法讲座
  * 表格式测试
  * 异常抛出
* 敏捷+DevOps讲座
* 设计模式初步讲座
