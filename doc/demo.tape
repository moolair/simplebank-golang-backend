Output doc/images/api-demo.gif

Set Shell "zsh"
Set FontSize 14
Set Width 1000
Set Height 600
Set Padding 20
Set Theme "Catppuccin Mocha"
Set TypingSpeed 40ms

Type "# Simple Bank API Demo"
Enter
Sleep 1s

Type "# 1. Create a new user"
Enter
Sleep 500ms

Type `curl -s -X POST http://localhost:8080/v1/create_user \`
Enter
Type `  -H "Content-Type: application/json" \`
Enter
Type `  -d '{"username":"john","password":"secret123","full_name":"John Doe","email":"john@example.com"}' \`
Enter
Type `  | python3 -m json.tool`
Enter
Sleep 3s

Type "# 2. Login and get access token"
Enter
Sleep 500ms

Type `curl -s -X POST http://localhost:8080/v1/login_user \`
Enter
Type `  -H "Content-Type: application/json" \`
Enter
Type `  -d '{"username":"john","password":"secret123"}' \`
Enter
Type `  | python3 -m json.tool`
Enter
Sleep 3s

Type "# 3. Update user profile (requires auth)"
Enter
Sleep 500ms

Type `TOKEN=$(curl -s -X POST http://localhost:8080/v1/login_user \`
Enter
Type `  -H "Content-Type: application/json" \`
Enter
Type `  -d '{"username":"john","password":"secret123"}' \`
Enter
Type `  | python3 -c "import sys,json;print(json.load(sys.stdin)['access_token'])")`
Enter
Sleep 1s

Type `curl -s -X PATCH http://localhost:8080/v1/update_user \`
Enter
Type `  -H "Authorization: Bearer $TOKEN" \`
Enter
Type `  -H "Content-Type: application/json" \`
Enter
Type `  -d '{"username":"john","full_name":"John Doe Updated"}' \`
Enter
Type `  | python3 -m json.tool`
Enter
Sleep 3s

Type "# Done! All endpoints working."
Enter
Sleep 2s
