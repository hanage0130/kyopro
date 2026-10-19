// https://cp-algorithms.com/data_structures/disjoint_set_union.html

#include <vector>
#include <numeric>

namespace hanage {
    struct dsu {
    private:
        std::vector<int> par;
        std::vector<int> sz;
    public:
        dsu(int n) : par(n), sz(n, 1) {
            std::iota(par.begin(), par.end(), 0);
        }
        int find(int v) {
            if (v == par[v]) {
                return v;
            }
            return par[v] = find(par[v]);
        }
        void unite(int a, int b) {
            a = find(a);
            b = find(b);
            if (a != b) {
                if (sz[a] < sz[b]) {
                    std::swap(a, b);
                }
                par[b] = a;
                sz[a] += sz[b];
            }
        }
        bool same(int a, int b) {
            return find(a) == find(b);
        }
        int size(int v) {
            return sz[find(v)];
        }
    };
}
