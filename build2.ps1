# 提示用户输入组件名称
$componentName = Read-Host -Prompt "Please enter the component name"

if (-not $componentName) {
    Write-Host "Component names are required!"
    exit 1
}

Write-Host "Building components: $componentName"

# 定义 TypeScript 代码
$tsContent = @"
import ${componentName} from './${componentName}.vue';
export default {
    install: (vue, module) => {
      vue.component(module.moduleName, ${componentName});
    }
};
"@

# 使用相对路径
$tsFilePath = ".\src\components\index.ts"

# 创建相对路径的文件夹（如果不存在）
if (!(Test-Path -Path (Split-Path -Path $tsFilePath -Parent))) {
    New-Item -ItemType Directory -Path (Split-Path -Path $tsFilePath -Parent)
}

# 将 TypeScript 代码写入文件
$tsContent | Out-File $tsFilePath -Encoding utf8

# 设置环境变量
$env:npm_config_name = $componentName

# 执行构建命令
& vue-cli-service build --target lib --name $componentName "src/components/index.ts"