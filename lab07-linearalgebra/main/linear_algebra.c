#define DIM 3
double dotproduct(int n, double a[], double b[]) {
  double sum = 0;
  for (int i = 0; i < n; i++) {
    sum += a[i] * b[i];
  }
  return sum;
}

// Y=A+B
void add(int m, int n, double *A, double *B, double *Y) {
  for (int i = 0; i < m * n; i++) {
    Y[i] = A[i] + B[i];
  }
}

// Y=sa*A + sb*B
void linearcomb(int m, int n, double sa, double sb, double *A, double *B,
                double *Y) {
  // Do this safely with temporary matrices
  double tempA[m * n];
  double tempB[m * n];

  for (int i = 0; i < m * n; i++) {
    tempA[i] = A[i] * sa;
    tempB[i] = B[i] * sb;
  }

  add(m, n, tempA, tempB, Y);
}

// A_t=transpose(A)
void transpose(int m, int n, double *A, double *A_t) {
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      A_t[j * m + i] = A[i * n + j];
    }
  }
}

// returns 1 if equal, 0 if not
int equal(int m, int n, double *A, double *B) {
  volatile int i;
  for (i = 0; i < m * n; i++) {
    if (A[i] != B[i])
      return 0;
  }
  return 1;
}

// Y=A*B
void mult(int m1, int n1m2, int n2, double *A, double *B, double *Y) {
  double sum;
  for (int i = 0; i < m1; i++) {
    for (int j = 0; j < n2; j++) {
      sum = 0;
      for (int k = 0; k < n1m2; k++) {
        sum += A[i * n1m2 + k] * B[k * n2 + j];
      }
      Y[i * n2 + j] = sum;
    }
  }
}
