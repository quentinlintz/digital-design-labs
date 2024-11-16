double dotproduct(int n, double a[], double b[]);
void add(int m, int n, double *A, double *B, double *Y); // Y=A+B
void linearcomb(int m, int n, double sa, double sb, double *A, double *B,
                double *Y);
// Y=sa*A + sb*B
void transpose(int m, int n, double *A, double *A_t); // A_t=transpose(A)
int equal(int m, int n, double *A, double *B); // returns 1 if equal, 0 if not
void mult(int m1, int n1m2, int n2, double *A, double *B, double *Y);
