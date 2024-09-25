<template>
  <DefaultItem/>
</template>

<script>
import DefaultItem from './components/DefaultItem copy.vue'

export default {
  name: 'App',
  components: {
    DefaultItem
  }
}
</script>

<style>
body {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #e9e9e9;
}
</style>
