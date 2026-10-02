Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEACB4F55BE
	for <dmaengine@vger.kernel.org>; Fri,  2 Oct 2026 16:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958525; cv=none; b=qTCsRCFAGp1V2loMH85cuSx+4DtRhToMWhrsTqbENvfIReF/BWZI5ke/O7sfuy+GDkW9Wx43/JKjUwDBqrRdFimgckaFv4NWqm2Q7DlSmrUCVkaj8XDEwHmslgbNALJ5ZedNzeuZx+QfauHKGweSApMCuty0N6ih++5nnU7H2bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958525; c=relaxed/simple;
	bh=0sWFSDlOAvoHRE6lhZxUe+khBYNiAjQi1l/eTcQrmEk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNdtn6LqWN3a8o+hXfVWI/CtQ+TDOaWU4RII7v91KzvP6z9TAmXLR3ywuY+KEEcX9kU/pQ2vbIPqL9N3mT6TZlCKtRtcSz32auMUomwZO2MQ+KXMp8iODpssgwNaniZ6ePFin9szddHlP5E8nQqmyZCyxqvkhAg6+tEs2JnSFBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tr4JS337; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tr4JS337"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7860C1F0089D
	for <dmaengine@vger.kernel.org>; Fri,  2 Oct 2026 16:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790958523;
	bh=/7GiwgTTnbxaKjIeSIQS8r9En6F9RGLpWDNNoWG3wLU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Tr4JS337dUGors2w+xaGd7jgf8vNPEd2iXnS14tv4RN68dLk9O07o8BqK2moNp45s
	 LCfH9d7pHvum3HlUYWWAeE7IHMCUj574x+h+K1JWF34TQNJCq2UXMHs22nNgOpmi0E
	 W1yUJszprR8QaIxa5sAh2NlZWpDl1m7Pui3ud39EFmA1A/ixTELDfYSM/YabMPB8LD
	 ErBp9B43Uy56kBemKEZh0LHIcivv+EwMjXR5FXu2lTyt4vJP76t8yojUQGT+trcoJP
	 FpW/rTStV9o6AYgYU+37VsyUygrQ1DFI7h6zsYBwZTW60OaeyAOEiUm37RC3huKVap
	 Mo38H+fggdDpw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3d90ac37so1266112e87.3
        for <dmaengine@vger.kernel.org>; Fri, 02 Oct 2026 09:28:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByc3uE0hu0GYXOXt7lLPimpzKyRQ0BgCW6/y7KfxB5ySV22rMNa266hJspGYnLssJxIFuLuuzf4hSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIX+zt9ERAIB6Bht7KoNbYzrzJx/mnNxiWIG+AX80KB6zQSEDZ+
	O7msMUuIJwWHyotcuncCcNb0mLVQPFmlkp6JfTdnMHDJMU3O2/mZKB5zQ0HHTMKSP5hA11cv+sW
	GRDvIMIMULc9p3Obqtd0JK+KIuYnxAECeWcoKOs/hDw==
X-Received: by 2002:a05:6512:2c93:b0:5b8:eb63:e56a with SMTP id
 2adb3069b0e04-5bb9bc625a5mr1076538e87.62.1790958522135; Fri, 02 Oct 2026
 09:28:42 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 12:28:40 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 12:28:40 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <ar_OXbdMsP43JM9v@SMW015318>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com>
 <CAMRc=MdVQ4xUFPtcytXt5Tqor5-fUjHiRvnpmxBsJpJbd1rHLw@mail.gmail.com> <ar_OXbdMsP43JM9v@SMW015318>
Date: Fri, 2 Oct 2026 12:28:40 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mfb-YspC2DBCfq+gay5Z7FkaK0HzfgwSiULaUZUxjMSgw@mail.gmail.com>
X-Gm-Features: AclHuK9yp0KCyrMyHFZmyb5EE6-5t-I3I0mGnqvFEwKOu7hUH8SX7KteEeIF1FQ
Message-ID: <CAMRc=Mfb-YspC2DBCfq+gay5Z7FkaK0HzfgwSiULaUZUxjMSgw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: dma: qcom,gpi: Document the Nord GPI DMA engine
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Oct 2026 17:31:41 +0200, Frank Li <Frank.li@oss.nxp.com> said:
> On Fri, Oct 02, 2026 at 11:46:57AM +0300, Bartosz Golaszewski wrote:
>> On Wed, 16 Sep 2026 17:21:29 +0200, Bartosz Golaszewski
>> <bartosz.golaszewski@oss.qualcomm.com> said:
>> > Add the compatible string for the GPI DMA engine found on the Nord
>> > family of SoCs.
>> >
>> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> > ---
>> >  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
>> > index 54dca623223d51373a4d54591f3ebbf5e31fca17..ad70717b5b86e600e74d6cfe42015dc03db25ba9 100644
>> > --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
>> > +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
>> > @@ -29,6 +29,7 @@ properties:
>> >                - qcom,hawi-gpi-dma
>> >                - qcom,kaanapali-gpi-dma
>> >                - qcom,milos-gpi-dma
>> > +              - qcom,nord-gpi-dma
>> >                - qcom,qcm2290-gpi-dma
>> >                - qcom,qcs8300-gpi-dma
>> >                - qcom,qdu1000-gpi-dma
>> >
>> > ---
>> > base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
>> > change-id: 20260916-nord-gpi-dt-bindings-f4b10102d22b
>> >
>> > Best regards,
>> > --
>> > Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> >
>> >
>>
>> Vinod: gentle ping, can this make v7.4, please? Otherwise, can you Ack it
>> and let Bjorn pick it up?
>
> I have not seen dt team's review tags yet. You should ping DT Team firstly.
>
> And subject:
> 	dt-bindings: dmaengine: qcom,gpi, although there some use "dma",
> but avoid confuse in future, all will consistently use "dmeangine".
>

Do we require DT maintainers' review tags even for a single liner changes
like this one that don't carry much potential for errors? For GPIO I typically
take small changes like this even without them.

Bart
