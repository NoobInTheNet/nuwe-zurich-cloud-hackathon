<!DOCTYPE html>
<html>

<head>
    <title>Image Upload</title>
</head>

<body>
    <h1>Upload an Image</h1>
    <form action="${API_ENDPOINT}" method="post" enctype="multipart/form-data">
        <input type="file" name="image" />
        <input type="submit" value="Upload" />
    </form>
</body>

</html>