/// enum Status digunakan pada provider di view model untuk menunjukkan status dari suatu proses yang
/// sedang berjalan pada fungsi di ViewModel.
enum Status {
  empty,
  profileMerchantComplete,
  profileMerchantNotComplete,
  merchantPaidOff,
  merchantNotPaidOff,
  start,
  finish,
  load,
  loadmore,
  refresh,
  notLoggedIn,
  notRegistered,
  loggedIn,
  registered,
  failRegistering,
  authenticating,
  registering,
  logingIn,
  loggedOut,
  verificated,
  notVerificated,
  initialize,
  notInitialize,
  initialized,
  error,
  loading,
  completed,
  notCompleted,
}
