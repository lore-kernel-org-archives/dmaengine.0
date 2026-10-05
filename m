Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7F34A0912;
	Mon,  5 Oct 2026 14:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791209684; cv=none; b=dOOOJ21wsOuycGezitbJ9iCBx5rT8wRkdq+9RN5QAWjJUf+Aw8iXuv59K6chp8U7FZgGFX7/KSXalCcuoygtBsue3NGHdZAa3U5nwuFztOBHTYwZMgtJyUENI8kwMp0FSEtuiKM8c4sxmIm+voZmQG2ygMyml6Nm4RNh0nKhoKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791209684; c=relaxed/simple;
	bh=UHwh7wFHuN5Ga6uewbclz9cNyo0kJzEZC9uqnAntPpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C05nMpUAOl0uMeNtcjC7ErOtDO7yu1yT8Yo/ZlmVEN0r/beWYME3rD4D2XHHYKRB3kBpwzN0bE4yk8ZRVg3Hbs1lRW/2advY2hUqoKIDtgRvFyeUtlERfPkUEVd51zQCWz/eSBSJ/ciJ4726ast66EIM5U5hlIWZSMfD3BDEaVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFpWSE8A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFpWSE8A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D6E1F00898;
	Mon,  5 Oct 2026 14:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791209674;
	bh=rVrrDfv4poJotbfMcfWYdkLo+G1+TYiRY9Y2dnE3WCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lFpWSE8Am/LCLqpkSREObdjxVg+T1lCW1a0IINduLTsAWVcqJj+SlbQU4K5om54Pc
	 bcXpTmNRqaILdQcsq31uRIjys0bk6szavl93IEAD+GMSw9nOuhc0cqUy9IrC6f1F+Q
	 raZE5PBu2z+5py2dA/YUf2Qr3oNrcZPsYjNtOkPSnW70w/IGvEhUvnWw83ohkY4jBz
	 lsR3B6tpSkioz73FDxSJ1Ch8PFxLIfFrCkZMDR0to1qLogNEoAlurvLaNdYPq4xX19
	 cvYGkS0+AiMVYHDUyPhXaU/H3465WSgFjbJcZD8WVxd0118qTMmFkinrxwSzOWYEam
	 RIhtfVm5YJAIw==
Date: Mon, 5 Oct 2026 16:14:32 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: dma: qcom,gpi: Document the Nord GPI DMA
 engine
Message-ID: <asOwyLDTFc3gMGXW@parshuram>
References: <20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com>
 <CAMRc=MdVQ4xUFPtcytXt5Tqor5-fUjHiRvnpmxBsJpJbd1rHLw@mail.gmail.com>
 <ar_OXbdMsP43JM9v@SMW015318>
 <CAMRc=Mfb-YspC2DBCfq+gay5Z7FkaK0HzfgwSiULaUZUxjMSgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfb-YspC2DBCfq+gay5Z7FkaK0HzfgwSiULaUZUxjMSgw@mail.gmail.com>

On 02-10-26, 12:28, Bartosz Golaszewski wrote:
> On Fri, 2 Oct 2026 17:31:41 +0200, Frank Li <Frank.li@oss.nxp.com> said:
> > On Fri, Oct 02, 2026 at 11:46:57AM +0300, Bartosz Golaszewski wrote:
> >> On Wed, 16 Sep 2026 17:21:29 +0200, Bartosz Golaszewski
> >> <bartosz.golaszewski@oss.qualcomm.com> said:
> >> > Add the compatible string for the GPI DMA engine found on the Nord
> >> > family of SoCs.
> >> >
> >> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> > ---
> >> >  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
> >> >  1 file changed, 1 insertion(+)
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> >> > index 54dca623223d51373a4d54591f3ebbf5e31fca17..ad70717b5b86e600e74d6cfe42015dc03db25ba9 100644
> >> > --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> >> > +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> >> > @@ -29,6 +29,7 @@ properties:
> >> >                - qcom,hawi-gpi-dma
> >> >                - qcom,kaanapali-gpi-dma
> >> >                - qcom,milos-gpi-dma
> >> > +              - qcom,nord-gpi-dma
> >> >                - qcom,qcm2290-gpi-dma
> >> >                - qcom,qcs8300-gpi-dma
> >> >                - qcom,qdu1000-gpi-dma
> >> >
> >> > ---
> >> > base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
> >> > change-id: 20260916-nord-gpi-dt-bindings-f4b10102d22b
> >> >
> >> > Best regards,
> >> > --
> >> > Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> >
> >> >
> >>
> >> Vinod: gentle ping, can this make v7.4, please? Otherwise, can you Ack it
> >> and let Bjorn pick it up?
> >
> > I have not seen dt team's review tags yet. You should ping DT Team firstly.
> >
> > And subject:
> > 	dt-bindings: dmaengine: qcom,gpi, although there some use "dma",
> > but avoid confuse in future, all will consistently use "dmeangine".
> >
> 
> Do we require DT maintainers' review tags even for a single liner changes
> like this one that don't carry much potential for errors? For GPIO I typically
> take small changes like this even without them.

They have been providing :-) I will pick this though...

-- 
~Vinod
