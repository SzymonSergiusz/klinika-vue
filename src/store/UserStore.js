export const UserStore = {
    namespaced: true,
    state: {
        userId: '',
        isLogged: false,
        firstname: '',
    },
    mutations: {
        SET_USER_ID(state, userId) {
            state.userId = userId;
        }
    },
    actions: {
        setUserId({ commit }, userId) {
            commit('SET_USER', userId)
        }
    },
    modules: {
    }
}