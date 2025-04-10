const String nicknameRegex =
    r"""^(?=[a-zA-Z가-힣]*\d*[a-zA-Z가-힣]+\d*)[a-zA-Z가-힣\d]{2,16}$""";
const String passwordRegex =
    r"""^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d!@#$%^&*()_+={}\[\]:;"'<>,.?\/~`|-]{8,20}$""";
const String phoneNumberRegex = r"""^010[0-9]{8}$""";
const String emailRegex =
    r"""^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$""";
const String codeRegex = r"""^[0-9]{6}$""";
