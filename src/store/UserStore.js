export const UserStore = {
    namespaced: true,
    state: {
        userId: '',
        isLogged: false,
        firstname: '',
    },
    getters: {
        getId (state) {
            return state.userId
        }
    },
    mutations: {
        SET_USER_ID(state, userId) {
            state.userId = userId;
        }
    },
    actions: {
        setUserId({ commit }, userId) {
            commit('SET_USER', userId)
        },
    },
    modules: {
    }
}