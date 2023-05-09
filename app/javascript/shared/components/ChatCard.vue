<template>
  <div class="card-message chat-bubble agent">
    <img class="media" :src="mediaUrl" />
    <div class="card-body">
      <h4 class="title">
        {{ title }}
      </h4>
      <p class="body">
        {{ description }}
      </p>
      <card-button
          v-for="action in filterActions"
          :key="action.id"
          :action="action"
          :is-selected="isSelected(action)"
          @click="onClick"
      />
    </div>
  </div>
</template>

<script>
import CardButton from 'shared/components/CardButton';

export default {
  components: {
    CardButton,
  },
  props: {
    title: {
      type: String,
      default: '',
    },
    description: {
      type: String,
      default: '',
    },
    mediaUrl: {
      type: String,
      default: '',
    },
    selected: {
      type: String,
      default: '',
    },
    hideFields: {
      type: Boolean,
      default: false,
    },
    actions: {
      type: Array,
      default: () => [],
    },
    showAvatar: Boolean,
  },
  computed: {
    filterActions () {
      return this.actions.filter(action => {
        return action.type == 'link' || !this.hideFields
      })
    },
  },
  methods: {
    isSelected(action) {
      return this.selected === action.id;
    },
    onClick(selectedAction) {
      this.$emit('click', selectedAction);
    },
  },
};
</script>

<style scoped lang="scss">
@import '~widget/assets/scss/variables.scss';
@import '~dashboard/assets/scss/mixins.scss';

.card-message {
  background: white;
  max-width: 350px;
  padding: $space-small;
  border-radius: $space-small;
  overflow: hidden;

  .title {
    font-size: $font-size-default;
    font-weight: $font-weight-medium;
    margin-top: $space-smaller;
    margin-bottom: $space-smaller;
    color: $color-heading;
    line-height: 1.5;
  }

  .body {
    color: $color-body;
    margin-bottom: $space-smaller;
  }

  .media {
    @include border-light;
    width: 100%;
    object-fit: contain;
    max-height: 150px;
  }

  .action-button {
    // background: white;
    // @include thin-border($color-woot);
    // color: $color-woot;

    background: #fff !important;
    border: 1px solid #005BAA !important;
    color: #005BAA !important;
  }
}
</style>
