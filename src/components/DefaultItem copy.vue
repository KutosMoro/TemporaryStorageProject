<script setup>
import { computed } from 'vue';

const props = defineProps({
    data: {
        type: Object,
        default: () => ({
            xxxx:1111,
            yyyyyyyyy:22222,
            zzzzzz:3333333
        }),
    },
});


const handleClickItem = () => {
    // emit('click', props.data);
};

const dataMap = computed(() => {
    return Object.entries(props.data);
});
</script>

<template>
    <div class="scroll-wrap">
        <div @click="handleClickItem" class="scroll-item">
            <div class="item-time" v-for="item in dataMap" :key="item[0]">
                {{ `${item[0]} : ${item[1]}` }}
            </div>
        </div>
    </div>
</template>

<style lang="less" scoped>
.scroll-item {
    background: linear-gradient(
        34deg,
        #fe4b56d1 -4.51%,
        #fe4b56a3 1.47%,
        #30ed7000 50.91%,
        #2d8cf0a8 99.79%,
        #2d8cf0e0 106.33%
    );
    padding: 12px;
    .item-name {
        font-size: 22px;
        color: #ffffff;
    }
    .item-time {
        font-size: 20px;
        color: #f0f2f5;
    }
}
</style>
