Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA93280A56
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 01:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787707835; cv=none; b=ernyHotuZ2QKySMnXIugpBU5NhZ6B+MEZ3Y1QY5Uy+KSx5QjhDv6bPQk5FVMJyuDr/iYP2nyGCbHlBRYG7XhKPfPOTtRyrlrrFJXhbWMXzj5xl+xvExqxHESN+HaDNv/vT5vBN7KuAPOhNzh8u5bCHVH8fB0pj5Ez5X+b80GMec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787707835; c=relaxed/simple;
	bh=xXHRUhCMZY1UP0UimNCUgmYKZUE5pAtrJ+aeGai+WZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ODpLGe8HqOdYBx6NQGzCVsXNWXFUBMFBP/soGdczerfMRDZQCYuv02+xQj/jIOINRUQu6pPZQrms+Hx4mAj50LDEVlDLHOH6Kr+eBki3GBlzpWRjX+oX7purmmPEm+arFPDiUmzN185W/HdmL/pSck8F7kF1gXd9t5hmu7hNI1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqCxpFx9; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqCxpFx9"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e50a650a0so18537185a.1
        for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 18:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707829; x=1788312629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=;
        b=QqCxpFx9tKit1CeUdzA7KKIWiWR16jjabqmEEjqhWetO3T7l1QUE6cVhi6HJdT8uVT
         hAD9Lc113pgNeVivzuGtn8wpY+F2LTKLPn63RTgwyIbaNQgrFjEvt63PmIURz6Ev8mhQ
         J8NVl/JwFNxb+KWCzYW9GWfs3QH5xsWq4LFDJIlSm01TEH7TEGhRNSrBQF1vtvsn8Ez7
         sRChfEpFSYOOx0ITXctWKmz6Gc9AkwdLB6wreeuoqALjMXcMnNwRIUZRc+umYjB8jJMI
         sbOsbainX0bTRKs+a5FjouSUc3ttNlz5ldjtscARopL55k3QHhbzK97VKAdr8LsxxOgJ
         8PaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707829; x=1788312629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=;
        b=eSGzoRNl3WEqEs6ZMuXs6bBvENDea/0ZOeqLcm6GdKGrvPtNfCc3tpP5tOh4XDhQ4G
         ILpZ/Ua1sXBn9DiRgsRCZ40LzbD5WdOYfuJg7Qee61fk0fShX9gjZbem58YpIJY8BODh
         T+daw4hAbNTdbggVRdvkvb1W5y81o9yub+uTI2rvxcmnPHblfh4/JuL0bZ3NJtU/tj6l
         NAcyOY3GETB6y/v1CswxEwTf7bvIZea1XnxZALCfSSkb8L7N42VVwP01xck1ReAxIAZv
         NKwXByOpjiElu5DVrsoESlPCB3XqqT1UnMGpkZelPCbWbGjkTCUxtuyApMUSn4xxgEhS
         9zqw==
X-Forwarded-Encrypted: i=1; AHgh+RoXzrL9rgu4EcfjEMnx7fY2UD0dUb08umF4dVNaxGzn/Prmt2ecOW4oT3Sn+NERIL5p+1QtXRWn+cM=@vger.kernel.org
X-Gm-Message-State: AFuF++mo5JmVO30A9N1hPiwamRXwZsebUIQRQrSDeo9jcB7uoT841RIA
	cIlLVTGJ2UKQ5IStkAyXI3LjF2szqtxFVFnUxJ5w14FEtleLz/aUQuaS
X-Gm-Gg: AR+sD108jGSmTW2qKzdEf84GRfbobKhm7jn81hX7kZ5rUCdEFS1+Cyb58prFOmRIkix
	psI2UL3FvoPwCwzsiShB5+P+NFL9943HZ9CnQPj8LMpvKmtimoYTUq1bjLzbOSfmBQrraaOP7Bf
	5iFDdkZppkr90tAT76VAbHKI6HP5zHbR9ooKIgAIEqyFGWriy/qPakJ1/3K5OsSH+ybI98dRg9q
	p5yjLOrs/41n9VBe6yEDuopQl9Lo0uRpCMZ2oPUe6FBzpczGxnl/LcAF/QdLxjE6jxCi4+wb0if
	883ULqip1/BS/zACaoiNNFVvnRLZd0ODF4ri4eQl5QdW9jsLTZpFNMoJpWwSPZRqzQUjcx6Scjm
	tOPrZdAzzp60Vma/WmmK0rel983owU7jsQ/xTEk0QosF29qTCAKy8SMWbbbXFGM+X7Es5zVm/ij
	pmveZFK4XnPeU8OZithZD+beKXxXi1Ayy09u6T9FiqlQ8RWiFblt5OSUHQdE+gYQ==
X-Received: by 2002:a05:620a:29c2:b0:937:80ca:7c4a with SMTP id af79cd13be357-93780ca859amr248149485a.44.1787707828653;
        Tue, 25 Aug 2026 18:30:28 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:28 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 01:30:06 +0000
Subject: [PATCH v4 4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v4-4-dc2f745f40dc@gmail.com>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0

Add `allwinner,sun60i-a733-dma` to the list of compatible strings for the
`sun50i-a64-dma` dtbinding documentation.

While the A733 DMA controller shares many similarities with the sun50i-a64
DMA controller, it requires a specific configuration due to differences in:
- Interrupt register layout and mapping.
- Number of channels per interrupt register.
- Support for higher (32G) address widths in LLI parameters.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
index c3e14eb6cfff..1cc3304b7414 100644
--- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
@@ -25,6 +25,7 @@ properties:
           - allwinner,sun50i-a64-dma
           - allwinner,sun50i-a100-dma
           - allwinner,sun50i-h6-dma
+          - allwinner,sun60i-a733-dma
       - items:
           - const: allwinner,sun8i-r40-dma
           - const: allwinner,sun50i-a64-dma
@@ -70,6 +71,7 @@ if:
           - allwinner,sun20i-d1-dma
           - allwinner,sun50i-a100-dma
           - allwinner,sun50i-h6-dma
+          - allwinner,sun60i-a733-dma
 
 then:
   properties:

-- 
2.55.0

