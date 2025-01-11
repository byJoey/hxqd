# 红杏自动签到

您可以通过 GitHub Actions 实现自动签到。

## 注册与订阅

1. 首先注册红杏平台：[红杏注册](https://hongxingdl.com/web/#/login?code=AHjklDYa)。
2. 购买订阅，使用以下 5 折优惠代码：`jhb.ovh`。

## 自动化步骤

1. Fork 本仓库到您的账户。
2. 仓库中已经包含 `.github/workflows/qd_sign.yml` 文件，无需额外配置。
3. 设置以下 Secrets：
   - **EMAIL**: 您的账号邮箱。
     1. 进入 Fork 后的 GitHub 仓库页面。
     2. 点击 **Settings > Secrets and variables > Actions**。
     3. 点击 **New repository secret** 按钮，输入 `EMAIL` 作为名称，并填写您的邮箱地址。
   - **PASSWORD**: 您的账号密码。
     1. 重复以上步骤，输入 `PASSWORD` 作为名称，并填写您的账号密码。
     2. 确保密码安全，不要与他人共享。
4. **自动运行**：工作流会根据设置，每天零点自动运行。
5. **手动运行**：进入 GitHub Actions 页面，选择对应工作流并点击 **Run workflow**。

## 输出结果

脚本会输出以下内容：

- 成功或失败信息。
- 操作的时间戳。
- 获取的流量（以 MB 为单位）。

### 示例

运行成功时，输出如下：

```
签到成功！
时间戳: 1736519481596
消息: 签到成功
获取流量: 72.65 MB
```

