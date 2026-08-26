Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189522EEE99
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 02:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712048; cv=none; b=GfqumzYYtMZsxNa0KbwFjkWEstGdN9qVnvpFZdPOh2HW1HnCLNrpxOfx5aPsmEF0d1M5nRmTw2QzO71KVlqItNwUrzi0zRGEQDrVV8IxA/0H6MTyHbmqDsjCPPz9cr6wbYC8gTdCTCdg3BRb8HFdjru66/0yRxc7g/uV6P/wHsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712048; c=relaxed/simple;
	bh=xXHRUhCMZY1UP0UimNCUgmYKZUE5pAtrJ+aeGai+WZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c0x0lyX/aVmb7HBneXes5ppfbkgP9ZUHiao8bLtMTeaxClKauGQizugXqXMAGr9tCC1Tc1Fnxr1zMOngSyxvuMz8bYa8a9FIUEO7yHAuw/mhJQHugac+zNU/9p7BHC7te0TDQUpNRorVU/IW1M63Y3vCAKn5Wu8/ZV2twn1BSb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pk9XpRg2; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pk9XpRg2"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-836c8bde2dcso5654587b3.0
        for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 19:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787712044; x=1788316844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=;
        b=Pk9XpRg25dB0z18cv7mPpbZ6XEafWo4Hs5YbkvJDFxXDKzgKoBr14/soR4jtCsws/O
         tzSkXAi5bxUIXHozvDwQ0ryjFsBeqtQwGsfOClh+P/TerXJ6fJp9W56RYd2WT2qWqRZa
         AgBZwc26a8UeEa43h8olZIr+Fj4BdeofhtgbVawGeyWy4DA0n3Bi5VujFFwZde8y8ZEJ
         EeFkk3zW44wrjxUIoKcNKtBmQDBQouUaU8KP6ufX94uRmk4uRBe5wCh7RQEHeLqZlztQ
         XSV6HrJCnWZt35gqAqje837caXHC+ON10OYPNxfxBbVA5HyXNVDp57OSpMrluVX3ssEs
         etxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712044; x=1788316844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=;
        b=nTxiyn50zjWHmv15BhMopoeCoAQwuYIALQn0htmzGAQg3cig+SpF8RtEkabBcKIBsW
         q9XoItieVU0FrCtFJoR4QuumjmUkaJf4QIMZhHMuu7+aWRHJfcI/JAdyoFIB68wCmp6q
         Hkyo2jMvZuQvL+U1G9bspcmAP5TKmSlMOOjGp+jUqy9az8Xq/M5fGtbXPaORtXrQDGNB
         boVBrq+iMwXsCe5Uu7Rk+JCa9fnn/5VarAZ3TykV5RDoweCOQv5xg4c3zAfyxsv8/UJH
         Y1epEujNRAiuUCWdDIaTjtmJv983jkyN0PTlr8mPe8KfvfvVV/DgClWiU/Hxe//wlhkD
         sftg==
X-Gm-Message-State: AFuF++l4yXkXnl5v3dlxKpoC2nDQJsIfAHHo3+bysVZdtKRk3sjvWs9N
	mLTQHJHDpYoV21D376c91VcMW+9SPX00briOPY2aG2gRQc+rrPVTmT0C
X-Gm-Gg: AR+sD10ONjOLq4UF49KxwmiOrFu5djTWSiU+eZHWZurE+A6/RBoQuyAPa31kYgIUdRH
	V1nO6aklhnFWmaIS6gueXU3k0EKjKboY1B622wpjY0eabzNKtR8HbG+5wVWBV/ItR2sKd5uNvoY
	zf1+cDtgia91xsv3CcKviUUNL4JnNfXVDgZhtU1XIvP+lZxe52slbmtbN2uvHq1RuutBSalK2Ms
	VvBVNY8flNClNVLT7f2RHboFIWrrttQ0mJuGNMBAR7+t2jRLDgOONn1B3y7XYH9BbB75W9vsL6R
	NquonrbOKqa8HXWTzp6P+OkW6tPLM0sTL6Oe2tPGAyTnex+bWztZovZKufdlM1OPYRSqMKsBNiC
	5jI6aGn6xoZMlnrCU+jclK5fzTu5zef04R/LVQHEklfMvSzqkjJKSTTka0S2TnCpEMLiEH2ZLkk
	zJ/y2HUu6IdlQI9TVrSLpTK0KQwGt3UUo1rVxMtBMGGS1+xlNyufTvEqPmdSKFoQ==
X-Received: by 2002:a05:690c:c3ce:b0:845:ddf4:a39e with SMTP id 00721157ae682-85740497985mr13245667b3.30.1787712044566;
        Tue, 25 Aug 2026 19:40:44 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-857053839fdsm9976087b3.10.2026.08.25.19.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:40:44 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 02:40:30 +0000
Subject: [PATCH v5 4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v5-4-abc5229b441e@gmail.com>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>, 
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

