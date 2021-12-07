<template>
  <div v-if="setProfile == '' || isLoading == true">
    <spinner />
  </div>
  <div v-else>
    <div class="row text-center">
      <div class="col-md-6 offset-md-3">
        <div class="text-center">
          <h1>{{ setProfile.name }}</h1>
          <p>{{ setProfile.tagLine }}</p>
          <br />
        </div>
        <div class="text-center">
          <h1>Bio:</h1>
          <span v-for="bio in setProfile.bio" v-bind:key="bio">
            {{ bio }}
          </span>
          <br />
          <br />
        </div>
        <div class="text-center">
          <h2>Email:</h2>
          <span v-for="email in setProfile.email" v-bind:key="email">
            <a :href="`mailto:${email}`">{{ email }}</a>
            <br />
          </span>
          <br />
        </div>
      </div>
    </div>
  </div>
  <div class="mb-5"></div>
</template>
<script lang="ts">
import { Options, Vue } from 'vue-class-component';
import axios from 'axios';
import Spinner from '@/loaders/spinner.vue';

@Options({
  props: {
    msg: String,
    msgSpinner: { type: String },
  },
  components: { Spinner },
  computed: {},
  methods: {
    isLoading() {
      this.isLoading = true;
    },
  },
  data() {
    return {
      isLoading: true,
      setProfile: [],
    };
  },
  mounted() {
    axios.get('/api/profile.json').then((response) => {
      this.setProfile = response.data;
      if (!this.setProfile) {
        this.isLoading = true;
      }
    });
    this.isLoading = false;
  },
})
export default class Welcome extends Vue {}
</script>
