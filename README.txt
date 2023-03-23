=====================================================================
TCR + Limbo 编程训练营项目
=====================================================================

欢迎来到 TCR + Limbo 编程训练营项目！在这个 README 中，您将找到如何设置环境、构建项目和运行测试的信息。此外，我们还将简要介绍 TCR 和 Limbo，以及为每个部分运行所需的命令。

准备工作
-----------
1. 根据您的平台（Windows、macOS 或 Linux）从 https://dotnet.microsoft.com/download 安装 .NET SDK。

2. 克隆训练营项目仓库。

3. 在您喜欢的代码编辑器中打开项目文件夹（例如 Visual Studio Code）。

4. 确保已安装 C# 开发所需的扩展或插件（例如 Visual Studio Code 的 C# 扩展）。

构建和运行测试
--------------------------
1. 在项目文件夹中打开终端。

2. 运行 `dotnet build` 构建项目。

3. 运行 `dotnet test` 运行测试。

测试并提交或恢复（TCR）
------------------------------
TCR 是一种将测试与版本控制结合的软件开发工作流。当您进行更改时，运行测试。如果测试通过，则自动提交更改；如果测试失败，则自动恢复更改。

在本次训练营中，运行 TCR 可使用提供的脚本 `tcr.sh`（适用于 Unix-based 系统）或 `tcr.bat`（适用于 Windows）。在终端中运行 `./tcr.sh`（Unix-based）或 `tcr.bat`（Windows）即可。

Limbo
-----
Limbo 是 Kent Beck 提出的一个想法，旨在通过尽可能减小传播给开发者之间的更改来改善开发者之间的协作。它实施了一个“实时共享编程”环境，可以平衡同时处理相同程序的工作，同时避免给其他人带来问题。

对于本次训练营，我们在 TCR 的基础上创建了一个 Limbo 过程。要运行 Limbo，请使用提供的脚本 `limbo.sh`（适用于 Unix-based 系统）或 `limbo.bat`（适用于 Windows）。在终端中运行 `./limbo.sh`（Unix-based）或 `limbo.bat`（Windows）即可。

如果遇到合并冲突，请解决冲突，然后运行 `./limbo.sh continue`（Unix-based）或 `limbo.bat continue`（Windows）。

祝您编程愉快！


=====================================================================
TCR + Limbo Workshop Project
=====================================================================

Welcome to the TCR + Limbo workshop project! In this README, you'll find information on how to set up your environment, build the project, and run tests. Additionally, we'll provide brief introductions to TCR and Limbo, along with the commands you'll need to run for each.

Preparation
-----------
1. Install .NET SDK for your platform (Windows, macOS, or Linux) from https://dotnet.microsoft.com/download.

2. Clone the workshop project repository.

3. Open the project folder in your favorite code editor (e.g., Visual Studio Code).

4. Ensure you have installed the required extensions or plugins for C# development (e.g., C# extension for Visual Studio Code).

Building and Running Tests
--------------------------
1. Open the terminal in the project folder.

2. Run `dotnet build` to build the project.

3. Run `dotnet test` to run the tests.

Test && Commit || Revert (TCR)
------------------------------
TCR is a software development workflow that combines testing with version control. When you make a change, you run the tests. If the tests pass, the change is committed automatically; if the tests fail, the change is reverted automatically.

To run TCR in this workshop, use the provided script `tcr.sh` (for Unix-based systems) or `tcr.bat` (for Windows). Simply run `./tcr.sh` (Unix-based) or `tcr.bat` (Windows) in your terminal.

Limbo
-----
Limbo is an idea proposed by Kent Beck that aims to improve collaboration between developers by minimizing the changes that propagate between them. It enforces a "live, shared programming" environment that balances working on the same program while avoiding causing problems for others.

For the workshop, we've created a Limbo process on top of TCR. To run Limbo, use the provided script `limbo.sh` (for Unix-based systems) or `limbo.bat` (for Windows). Simply run `./limbo.sh` (Unix-based) or `limbo.bat` (Windows) in your terminal.

In case of merge conflicts, resolve them, and then run `./limbo.sh continue` (Unix-based) or `limbo.bat continue` (Windows).

Happy coding!

