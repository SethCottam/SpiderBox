@api.route('/test1.html', methods=['GET'])
def test1_html():
    return render_template('sandbox/test1.html')

@api.route('/test1.js', methods=['GET'])
def test1_javascript():
    return render_template('sandbox/test1.js')


# if __name__ == '__main__':
#     api.run()
