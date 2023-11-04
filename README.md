# Ghostscript Layer for AWS Lambda (v10.02.1)

[![Build Layer ZIP](https://github.com/cbschuld/ghostscript-aws-lambda-layer/actions/workflows/docker-workflow.yml/badge.svg)](https://github.com/cbschuld/ghostscript-aws-lambda-layer/actions/workflows/docker-workflow.yml)

Scripts to compile Ghostscript (gs) for AWS Lambda instances powered by Amazon Linux 2.x, for the `python3.7`, `python3.8`, `python3.9`, `python3.10`, `nodejs12.x`, `nodejs14.x`, `nodejs16.x` and the `nodejs18.x` lambda runtime.

## Description for AWS Serverless Application Repository

Static build of Ghostscript 10.02.1 for Amazon Linux (via the AWS SAM team), packaged as a Lambda layer. Also provides PDF files conversion support using ImageMagick (requires an [ImageMagick layer](https://github.com/cbschuld/imagemagick-aws-lambda-layer)).

## Prerequisites

If you want to build this environment yourself, you will need:

- Docker
- Unix Make environment

## Deploying to AWS as a layer

Run the following commands to deploy the Github compiled result as a layer in your AWS account.

```
wget https://github.com/cbschuld/ghostscript-aws-lambda-layer/releases/download/10.02.1/ghostscript-layer.zip
aws lambda publish-layer-version \
    --layer-name ghostscript-v10-02-1 \
    --description "Ghostscript 10.02.1" \
    --compatible-runtimes python3.7 python3.8 python3.9 python3.10 nodejs14.x nodejs16.x nodejs18.x \
    --compatible-architectures x86_64 \
    --zip-file fileb://ghostscript-layer.zip
```

## Additional Info

For more information, check out:

- https://www.ghostscript.com/

## Author

Chris Schuld &middot; [https://chrisschuld.com/](https://chrisschuld.com/)
Thank you to the original work by [Tomislav Capan](https://https://twitter.com/tomislavcapan)

## License

- These scripts: [MIT](https://opensource.org/licenses/MIT)
- Ghostscript: <https://www.ghostscript.com/license.html>
- Each library has separate licenses, check the respective web sites for more information
