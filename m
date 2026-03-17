Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E489A38A71D
	for <dmaengine@vger.kernel.org>; Tue, 17 Mar 2026 20:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773780664; cv=none; b=eaRCYOpniml6RqY5lQ9T1QFJCpoimawRdm9NSDSwS4STk/D/H9eIbyXva/rErNloNVfdwAe5mRwNUOL0JDniPFFDuJdUbrWQwxmvuZnsENgxATRIaFqibEC2sjHsoDDkBzNDKQMq4OHB3bwaK5VuSVyZFVLSZpMtUU7ijxZT8EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773780664; c=relaxed/simple;
	bh=yntkghlcCP7ZIzwF2Sh3ioPGHdXavGN3D4wJZF+nEE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bdKb8UB9zpOcpLy+BKNexFeJdX1r8cquxKlBba3C9Maak8Ynh7hgcqn9zGnzqQV4q1HAUje5wiYeQqoLGHP8YeiD8zQHDpHVTV5mXU1Ash/tWQg4OKOlgC3P+5BFybRqgaYKCgnVn8LqrykNViWRgdai2XMZrQlLELp9a9hdodQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hO62Zr5w; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO62Zr5w"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b45bb7548so60135f8f.1
        for <dmaengine@vger.kernel.org>; Tue, 17 Mar 2026 13:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773780661; x=1774385461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7yFBJVJpKs5V7I19enN0uxv92VPjioQfGoucnyTKKqE=;
        b=hO62Zr5wXn+5fG2NSIxA3RysgKWXYEBt6HPcheu54DQ5dabEVi24bbTtV4dMy8lsYU
         z3zMDIlZ/haDHvtboukDXmFeqa21qI+QBw7DkM70u+mC2dtqZJpRC+8X1FczxYye2NMe
         GHuXiqrzgcrjWXt8FP+YK1fAoB3WSA+olJ/icOQ3B7+0GoVyKIsTQl8zIqyCNhi09sa4
         0DXOcoY9jb0Nsqpyiqi536yR2eWVooJwzeRXaB1nhS3CEnubeIo7ilDfkD3jkEOBbQUd
         qRzPFiZSy8RlLSmXF49SSXErLRM7cR/QlfpqBcFLHQmKjioyzFJfJ1KKrD8aKQKAHbwX
         Ij3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773780661; x=1774385461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yFBJVJpKs5V7I19enN0uxv92VPjioQfGoucnyTKKqE=;
        b=If4jEQYHZgy3HYTzP3wPcKdaDeMZuQeF24ikqnL43c4rDPrrHAxD2LDODnkTkusQSd
         QhRlnMXH2q79kcBy97Y+s5PfXAc/15kwZ1DQR9MC4huldp2+PUxJSiObYtP3yfL0wQkh
         RAkFtrMm9UIIFpwi4SeFPyXI7fZ8qHLIeAnlkPpHBkB8aV/dJxAFAAOyMkwade3vYmhY
         rYtc1+FOseJaKiQkGfLIDss4M2sSn1hkr/vW0lvqCZKARYrEqjVNoydks3hlxyELpwkM
         PfOSIZYFE4mjnNpHxf2mhwa+uYWoX5JzTbRbP0fFZiIxRbS6PEXcvTCc9eQdEIE15SpV
         dkKg==
X-Forwarded-Encrypted: i=1; AJvYcCUH7I5lwsDpMzkWTJ5UFr6dP/qdyFGiFHcIIDbFwCmep3ndeEpuNmEtJkCCWASKNSEM5T82svbdt4I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6gnRCXgvgHHw6ZAFT6FLFSpJt66RiHx8SIke19iWlswhGXywa
	tRsMQ6fSDW86pvNaHImz1uy4F68kP+fcAxEE8A70NTBne+PCFb9uHyp9
X-Gm-Gg: ATEYQzyCEH8MyExOUil5X/7AmDPSMmaK5djQPurusaqsORqD44f/etiv6kZ27mR7qai
	8lHoGSzWaON9+EfhSbwbUQnpS4xugxFlJ8LTebBlQAA/gBbfQsjMnSMLns/wX4cZiaMV1R0SOfC
	pdbKpkKeGRPWDQO9C20KE7y1aPAl3iXk8fzmlugXPapjrudlcaoRaksg20gdpSx22Cm5aK7CGUA
	LqrkGqPVWGm4Qk1dIwuhVDMdmSpveGfQD3U0ICuCQCZWesbM2DSlahZTXG0ETTlsYdcv0J9731r
	XJL0Zp6Byr0Jyzq9dOXyF2dhOQ+Zf1X7bDgHdSvkw1dyPqrbtKj0rH4aXQiWLnHC5CT1fMXnNxH
	Kvwbf2decnEauDXbgXVi70mqctI9jDw06zCGALfmE9/YUKQldAnSo31Z/gHrX1oaU5TOkX0wvam
	26Ab96gK8Bc0KU8dR9SVebOQ==
X-Received: by 2002:a5d:584b:0:b0:439:fe98:20f9 with SMTP id ffacd0b85a97d-43b527c4d66mr1136366f8f.27.1773780661024;
        Tue, 17 Mar 2026 13:51:01 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518522d7sm1706550f8f.13.2026.03.17.13.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:51:00 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] dt-bindings: dmaengine: Fix spelling mistake "Looongson" -> "Looogson"
Date: Tue, 17 Mar 2026 20:49:38 +0000
Message-ID: <20260317204938.120729-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in the title field. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../devicetree/bindings/dma/loongson,ls2k0300-dma.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
index c3151d806b55..8095214ccaf7 100644
--- a/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/dma/loongson,ls2k0300-dma.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Looongson-2 Multi-Channel DMA controller
+title: Loongson-2 Multi-Channel DMA controller
 
 description:
   The Loongson-2 Multi-Channel DMA controller is used for transferring data
-- 
2.53.0

