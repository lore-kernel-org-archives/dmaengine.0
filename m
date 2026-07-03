Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE8A318EDA
	for <dmaengine@vger.kernel.org>; Fri,  3 Jul 2026 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066631; cv=none; b=sojXlaHCEUM+74jcHkgfODogxUCUF1c/22ubGD+hG9XoZsXUZ53h+BFgOC0pL4x+uhSQV20rG9I6j4M9gvuudkpyqhMYpR/Mk1SA7tlb7Hz12kNGHTwB/RuWy5dslCDVQZA1+88OdjbAz0IQjcV5bigYyffl3BpsLSVNdqP7Iqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066631; c=relaxed/simple;
	bh=nTYyMiarnZTlmVfRe1ETq029/JDALxN2KmbA0e8CzUQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rK0Lr4JZUGcrPOTeAFwZ8duu9u6IKeB4tnNU/Mw4T7CbJuEdK/yAOsRRjrAy5F1lZw/RVBevCFpTvsMwdLwBu0W7NRSmYQPQrYqu9QOIl0MXhyKQvOBUNTx9PkdpY8cvrwcdXsr/fqMEISDCFCldWW18/SDeiIvyzikfds/SEsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbcWssHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbcWssHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE271F00A3A
	for <dmaengine@vger.kernel.org>; Fri,  3 Jul 2026 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783066630;
	bh=zMwGlCY0qDd/oj0VSbtmLHDTCyT0fBJfuKt+jawq3AQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=dbcWssHsz8RAzGVqhmI5TsQgXVYuhjhiCrk9lwJh8ma2HlzhAVhEXWqu4bQdSAKTn
	 Jr8sYgpRMRdsYbNUrmydTRCWEaMr3BPefPBP0zEZIJNQN7zOYhCjeW2CKecu9YYgGN
	 xyjUVIusYDTPliiafp0VNiF2fskyYo68rRZvg/Uyil2W/nrd1+QPtp76O2nlkem1A2
	 znkvxtwUFupH8yNz1wbFJM7QcB1nPsaMSoT7Zlh6OqEJYs9k2nwE/gpaMUnviSgOgL
	 ECcj1lRavxe7e77LJ5WGdPnQy5mlCI8CxuPja2KtWyBfaTzg20ue5gFh4L23u723MT
	 qJ9nwBL/+btXQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39b217f54daso3161191fa.0
        for <dmaengine@vger.kernel.org>; Fri, 03 Jul 2026 01:17:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp+eb5yY3JgtYWaO+K4W03yvkQfa8iDrc2+3cyo4E2j+TZ2HL+rn2TgBMUO+c0qra/3ezhRnB4MueE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv51zP56bTp1uWd7P3o1Ma4TiI0NE4aion9u2UqLYa/nqwv8Rw
	OvkaqKMyoJ5222yo44KpEjsLzjKQL09ZI15fHlHvsjzVZGj/IaRIp34Y4myFsIrViPKZFB5DMvs
	EsbvAhbK30ya6u08tDSgfXy++nitwK1nvy+ccl02FFw==
X-Received: by 2002:a2e:a012:0:10b0:396:7f0e:44c1 with SMTP id
 38308e7fff4ca-39b4520949cmr4949141fa.6.1783066628975; Fri, 03 Jul 2026
 01:17:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:17:07 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:17:07 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260702-b4-shikra_crypto_changse-v2-3-66173f2f28b3@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
 <20260702-b4-shikra_crypto_changse-v2-3-66173f2f28b3@qti.qualcomm.com>
Date: Fri, 3 Jul 2026 03:17:07 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfO-FbSan826iJHmmzbYiBef-VeaNZYknt8-DTAokOHoQ@mail.gmail.com>
X-Gm-Features: AVVi8CfXqvsJYrsz0ptDw4IguKYBAEl0_kJcaaN_S4BZ9fYt6GWOgeh4XZj99rs
Message-ID: <CAMRc=MfO-FbSan826iJHmmzbYiBef-VeaNZYknt8-DTAokOHoQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: crypto: qcom,prng: Document Shikra TRNG
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Harshal Dev <harshal.dev@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Andy Gross <agross@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Jul 2026 22:17:13 +0200, Kuldeep Singh
<kuldeep.singh@oss.qualcomm.com> said:
> Document shikra compatible for the True Random Number Generator.
>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> index dc270c8aedf3..5de52d7a745c 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> @@ -30,6 +30,7 @@ properties:
>                - qcom,sa8255p-trng
>                - qcom,sa8775p-trng
>                - qcom,sc7280-trng
> +              - qcom,shikra-trng
>                - qcom,sm8450-trng
>                - qcom,sm8550-trng
>                - qcom,sm8650-trng
>
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
