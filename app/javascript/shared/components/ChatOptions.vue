<template>
  <div class="options-message chat-bubble agent">
    <div class="card-body">
      <h4 class="title">
        {{ title }}
      </h4>
      <ul
          v-if="!hideFields"
          class="options"
          :class="{ 'has-selected': !!selected }"
      >
        <chat-option
            v-for="option in options"
            :key="option.id"
            :action="option"
            :is-selected="isSelected(option)"
            @click="onClick"
        />
      </ul>
    </div>
  </div>
</template>

<script>
import ChatOption from 'shared/components/ChatOption';

export default {
  components: {
    ChatOption,
  },
  props: {
    title: {
      type: String,
      default: '',
    },
    options: {
      type: Array,
      default: () => [],
    },
    selected: {
      type: String,
      default: '',
    },
    hideFields: {
      type: Boolean,
      default: false,
    },
  },
  methods: {
    isSelected(option) {
      return this.selected === option.id;
    },
    onClick(selectedOption) {
      this.$emit('click', selectedOption);
    },
  },
};
</script>

<style lang="scss">
@import '~dashboard/assets/scss/variables.scss';
.has-selected {
  .option-button:not(.is-selected) {
    color: $color-light-gray;
    cursor: initial;
  }
}
</style>
<style scoped lang="scss">
@import '~widget/assets/scss/variables.scss';

.options-message {
  max-width: 17rem;
  padding: $space-small $space-normal;
  border-radius: $space-small;
  overflow: hidden;

  .title {
    font-size: $font-size-default;
    font-weight: $font-weight-normal;
    margin-top: $space-smaller;
    margin-bottom: $space-smaller;
    color: $color-heading;
    line-height: 1.5;
  }

  .options {
    width: 100%;

    > li {
      list-style: none;
      padding: 0;
    }
  }
}
</style>
