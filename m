Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793655362;
	b=ktv4oSi0boPL6PlyTe2vTJMqhE4nPflIs9vt6H02EXSlZdsQae4slC0agHLacF8sWgVR
	 FL3cLbfCMNFlE/24T6ysMs8PUeCHcv1Mg1eyq4eyRLbRz1LkMP3LkB4XOgN/T7tCdPkie
	 1IV4WduOcvPLdycRggt7CrumDmTQYL+KHt32Jm0BbEh803cWJ275QBjxjh9nZRKAtDlF/
	 eQqGSGgTrIwHmonxSAtYQ7lzw8YhfBU892uiKlRMONdBTPyOBG4VdDDBAzQRgKYbuUlWq
	 4mlk37XqHHmdRTjJO2aBo8VsrYCPHZy8uk6+txODqK5Y+LqZvlhdmnhgi4M/sf9YsOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VHV6XZXV3oT+cCr5eIzbFOalP1E93sRXCTUPESAW1N8=;
	b=zDmDTEMufSGCkczduDf67QkMqOnAIQ724ZZXulxsC9jrB0FflCN28tJSlJ88KYPtM9K/
	 opEu/UmZWatBXiLatxsvvP6AiopetPPUhTwfumbhtP7PDN+Db+9Oc6ixVG//FTlR9joar
	 bBhdpQc5/0i6BgmhdVbU9dwAZIyUFv6EiLA0bH5rkjOuwqHq+vN5UXQR1/70hR0DDjdlf
	 ggUxyzweJp5dCYCFiXgl+95M++jyMGSqQoiaDEt/32JHHF1E50iLcYCAeEC6YVGlos7mI
	 KdtsB1xyeGkADEK66BHK3JVkObEUEWx6k+xkQ58cSTd5m4uM5GR4tfpAphRfl5dUM/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSzfSyJH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED82606EE84
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 21:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ED82606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSzfSyJH
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93f3c89594cso237781785a.2
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 13:36:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793655360; cv=none;
        d=google.com; s=arc-20260327;
        b=MqihrBRr0zlO0FDY+6XQKQ5ksHbBQCdvoQx6g/pknt9PTW6WE74yf3ybJlQYZR3671
         J6EUOMF+W+FG62lyGdI5En7tYzELQEGeDItGQBIPFGXRqGSWQoC4J07l2uGFNzbG1Veq
         NI0j/Zb7gVBhxAc3gA8JM2zjLHUTuKiWDeUMAXLWbpr+Yb8yJfJ1epr7rdLp7GFyJPYQ
         9ZfW9ZSvRn+eLfMvGZGDPPUrFvq45iwmDFtxWdK1FwIJFoRdqCmm+WqxKuHMSd38vALj
         DyK/RtNAni2+nuP279hK3jNgzmYvDsUal4jv/ob5+SVtfSxA6a8lcz0rhtR4BxQ/tYkk
         sWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VHV6XZXV3oT+cCr5eIzbFOalP1E93sRXCTUPESAW1N8=;
        fh=KykOM8UI165T2eNogDvooDUrak8t3rJj00elM7DcewQ=;
        b=ra7tJdb5gSgwIHn/wGceQued0TRPpqLbmM3/YsB2kpItacdxyuo+69dQr2arlW+7fz
         Zo+jhhtAEXuqjPHkJB8jVlTA/rPZiOpyTAwTSPOJx5BpGULpPq0VyDMOSmN5oTp4/m9w
         xz3P63YPhZ3DNVdW8lhSu5qnBriZPHzc/L7uHsp+FZN9zXkpNmaRyUDo9DN2eriz4p/E
         gToydE/U/vAvWO0sjcn/SAFqoZaht9gRdxBBTuwGGo71KugV3bjhK0PZwORR/GevZBJt
         ua5JzNDEZGHxmuSVFA+ZyM87DqZp7TYH0DfoaLgS3xWJYWkyAN4zIWyRtWxU1c934S6x
         9evA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793655360; x=1794260160; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHV6XZXV3oT+cCr5eIzbFOalP1E93sRXCTUPESAW1N8=;
        b=DSzfSyJHVupjsqzVXsjHvmmI5zMAo3+qhFy8bWOl8SLjNC7Wb+eqr9xN47R06NkFlu
         0urlZBeRkiHxuKH2lL0x+ktcFBoqk6bq7waiMvb/quyzv+3PVLMyNWjeQUwoWTT3J6PS
         pgz2evpgZrJFLh6Yep6MA2ux9c2Vb9JSKWkXf/Ks8jdFM6M3h5hqKcyVW37qOYD2jbpD
         CV8RdhYraJUS/ESsMtx2JrUYQ+4E5kFMWv27PO07SKwEF0VPQRBBp2ehPlUu49P3qYaA
         utwufyW7pLBmhPupxlY4U14wGQneUPlGTzDv171/FzoqLoeWXMs+U79kwyMXC/hlwRW5
         VWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793655360; x=1794260160;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VHV6XZXV3oT+cCr5eIzbFOalP1E93sRXCTUPESAW1N8=;
        b=nsgkNtkmV5et/1frKB+DrGWYmXNAx2gt3tFmbbsDSHcPcEQ2XDZtv7QaMeyeGba6R+
         /yLoNxy/iVYuxxWypY+UvL4jqe1oNTp5TMitdjnI9PRxnSpp30j8K5+WBmW/IFRVgS46
         nTYPqE0ieyuLZocZflj7LIFlzZ7Omh8XPZD/0I1NGxIM98oGqGcHSeS3FavtWY7gQeXl
         6xK54qiCWLA07HDhCogd3ELTbji5vDLdUp0x15RH2GL0cpeDapCs4uG0O1L2QjNdsa8W
         qrC9u+dPfMLOIPo0aFR1HjwciP4C8MgC+FohuHQnjwRCXrl5gP8TA2u4pz8tKQ+1eyof
         F7Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxNA9aggE1+lVW2zuoLsMdIItezcnpNJPETxy6Nlea/ASUr/Iq+M7RvRzrQ79aV6xiPC0VcBLf5e6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOqv23LuKWTDR/Uzu3wvRUQWecLR+jQe3uQ/wKYb4VDUxL4SqW
	qPBn/7Rcu+x4+FAlYInr66WF/LzGSc6htW6q0eZWk6xgIlKNbM0lko+p1Nt5c+AtQWjIXtHvAjN
	puEQ0ZhfF9Gt1gR5PUu9r59oyeYBeLWc=
X-Gm-Gg: AYBFou2lG2zDSxU4X1owFZvJVzI47GYfXa7MLFMckyn3ITUFBeJlnyLagzw1KsVSiLd
	3xxNP410/Yg4OsiIsU8d4MpWLlr0BYzh4adQtB1sGMzcuNYDOEAPHmmsYNVXYCOJ2W8OikAVd/W
	xwMa6ijthpQP6GHDPPPMcfbLW6lYDZsViyUWxlz48uSlzaQlgEZ/b0QfOrk1afhg2WdyPwebk5b
	dikgzR3mTIiGbJOQ9sn9rh9b0INaf4Jk1wfGzWwY+uCYTRtNbP3RCNiJ4kOGBauqfvsyKzHvE7C
	07v8YODSeX2KOu0mHBbve9XBaAvkPRTEkE+w7t2LMiMO+9oySm4aUqEMis6q2pRvBUPj9rU8j7n
	bqeBfx3jVKN/kLe56i03+4uh3QMIlo0B2WHn6FTRx5+/3S8PFQEKk2JJ5m2P4aBzfUYONuJywL6
	kg5HO+mqYPQE+D4o6vbsw778N+LEOvIxeTW2Wf0GQedQ93zsOHtWdEgahscgKjprldiAAJZ249+
	bnuMORb8SuelUYsQ0RvL9qolXkRvysU/lE=
X-Received: by 2002:a05:620a:3708:b0:93f:d27:c89e with SMTP id
 af79cd13be357-9442175c185mr1940666385a.75.1793655360542; Mon, 02 Nov 2026
 13:36:00 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102090713.896324-1-pbrobinson@gmail.com> <20261102090713.896324-2-pbrobinson@gmail.com>
 <20261102-email-target-d3191584d234@spud> <CALeDE9Ncz=6jo_1VxdCJgSVV+fCTgkUvci-=e4MQYFYo_O9M0Q@mail.gmail.com>
 <5bd67c8d-41ee-40e7-ab75-031e1520758f@gmail.com>
In-Reply-To: <5bd67c8d-41ee-40e7-ab75-031e1520758f@gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Mon, 2 Nov 2026 21:35:48 +0000
X-Gm-Features: AclHuK9c_iqft5lz_6jUeAVYzMiPhlLMeoYQ4TVGFVp9pkGtrtWvK0tM_qVXpc8
Message-ID: <CALeDE9NhPa3V4jJ-Lc1sOujdrSAtkOuoeLW98NBxUai2qZFoLw@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and BCM2712
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 20:38, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 11/2/26 12:18, Peter Robinson wrote:
> > On Mon, 2 Nov 2026 at 19:39, Conor Dooley <conor@kernel.org> wrote:
> >>
> >> On Mon, Nov 02, 2026 at 09:06:51AM +0000, Peter Robinson wrote:
> >>> Add compatibles for the BCM2711 40-bit DMA4 channels, which are
> >>> described by a separate node covering channels 11-14, and for the
> >>> BCM2712 DMA controllers. The register address of a node identifies its
> >>> first channel, allowing a controller to be split across nodes.
> >>>
> >>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> >>> Cc: Rob Herring <robh@kernel.org>
> >>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> >>> Cc: Conor Dooley <conor+dt@kernel.org>
> >>>
> >>> ---
> >>>   .../bindings/dma/brcm,bcm2835-dma.yaml        | 31 +++++++++++++++++--
> >>>   1 file changed, 29 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> >>> index c9b9a5490826c..31d97a10a0ea9 100644
> >>> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> >>> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> >>> @@ -9,18 +9,27 @@ title: BCM2835 DMA controller
> >>>   maintainers:
> >>>     - Nicolas Saenz Julienne <nsaenz@kernel.org>
> >>>
> >>> -description:
> >>> +description: |
> >>>     The BCM2835 DMA controller has 16 channels in total. Only the lower
> >>>     13 channels have an associated IRQ. Some arbitrary channels are used by the
> >>>     VideoCore firmware (1,3,6,7 in the current firmware version). The channels
> >>>     0, 2 and 3 have special functionality and should not be used by the driver.
> >>>
> >>> +  BCM2711 channels 11 to 14 are 40-bit capable DMA4 channels, described by a
> >>> +  separate brcm,bcm2711-dma node. BCM2712 has 40-bit addressing on all
> >>> +  channels, with channels 6 to 11 being DMA4 channels. A controller may be
> >>> +  split across several nodes, the register address identifies the first
> >>> +  channel of a node.
> >>
> >> Uh no, a device should not be split across different nodes. This should
> >> not be needed, why can't your driver handle the upper channels having
> >> different capabilities?
> >
> > This is the way it's done in the downstream kernel, unfortunately
> > Broadcom doesn't publish the HW details so either they'd need to
> > contribute the support (which they've not done since the RPi4 was
> > available) or I'm not sure what the other options would be. Open to
> > suggestions.
>
> Neither here nor there, IMHO, yes it would be nice if documentation was
> published (and a customer like Raspberry Pi is probably one of the few
> that can get the needle to move there).
>
> You have the bcm2711 and bcm2712 compatible strings which should be
> enough for you to know which channels are 40-bit capable and which are
> not, yet keep the same Device Tree node.

From reading the downstream commits though it reads like the different
channels have different capabilities? Or am I reading that wrong and
it's the different generations of the HW that have different
capabilities?

Peter
