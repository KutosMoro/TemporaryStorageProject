# 提示用户输入组件名称
$componentName = Read-Host -Prompt "Please enter the component name"

if (-not $componentName) {
    Write-Host "Component names are required!"
    exit 1
}

Write-Host "Building components: $componentName"

# 执行构建命令
& vue-cli-service build --target lib -- "src/components/$componentName.vue"