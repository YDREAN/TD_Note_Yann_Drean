
SECRET="TD_Yann_Drean_OpenSSL_2025"
HEADER='{"alg":"HS256","typ":"JWT"}'
PAYLOAD='{"sub":"1234567890","name":"Tyrion Lannister","iat":1704388115}'
b64url() {
  echo -n "$1" | openssl enc -base64 -A | tr '+/' '-_' | tr -d '='
}
header_enc=$(b64url "$HEADER")
payload_enc=$(b64url "$PAYLOAD")
signature=$(echo -n "$header_enc.$payload_enc" | openssl dgst -sha256 -hmac "$SECRET" -binary | openssl enc -base64 -A | tr '+/' '-_' | tr -d '=')
jwt="$header_enc.$payload_enc.$signature"
echo "Ton JWT :"
echo "$jwt"
