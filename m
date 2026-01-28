Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A182EC0B5
	for <dmaengine@vger.kernel.org>; Wed, 28 Jan 2026 11:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599841; cv=none; b=LIU/FAwRWCsNt7ltal71LhIYEcgGO6ilT4F7KFu0FuuAfhyF8PK5AD9yNZWVVbB0L2wtNFnT2IKlw+aaBOI1SzaxS4sVddP+F8c2hpgRhHoQQO/kb1nfGNBQkGhcbDBgzSCyxSBykRqBq1gLUqgCJeVFWLeqh1q1Pl9CkUl01IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599841; c=relaxed/simple;
	bh=byVW65zPltQ7vedzB43Li2CtZrKc+x6FuEaSKJSESOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=erRN/51po3BUB2P0PB6CvD67q9kwMJmNY1ImkiUqho/wnroHvWyUhvFuY6kAdnFq58w4Gve+Yg2If7BPeSiYhevsu3iSPVA4+lBJgkEuAlpVRalAoBfmsl6Ypk7bT98UastN9xWYvYaRb9e7fDFuAy6JU5kkP8ECKcbfdRHCGmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LU4q/swx; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LU4q/swx"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b884ad1026cso1094292266b.2
        for <dmaengine@vger.kernel.org>; Wed, 28 Jan 2026 03:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769599838; x=1770204638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1Qm6tXnDfkhnc+vPFBLjvwAKO1y0Lkh4JNke/KQIEE=;
        b=LU4q/swxw/AgQIFzaZ/op+ANouAAlq8bT4y/dn1xL5QNSPDX1k1w1EweqLoOpvfPem
         xBspzj5LSJL8smuzb8nU1DnwJ0mNgb02sFRqZmocwcdBpJ/kkb5/UNknVZOn5RADI6Vj
         lqc+3DpjgA7cu7cklKdAo25SX9I/zFiT1fOzxCF4BrEkYhJzdHd+kIF2Yz6Qzu9lUa+C
         mHhWuE6vJTqaYLrarhC+P014S8Bg0Gkvts5qdum7Wvbwr8hoi6dGHEZZNkBvUANm1hel
         HH1eJrXeK+uIfPinktL0bs05jae2C6NX7zAeN/d8smoxNeL10SCwD8P7BM1mTGn7FdPx
         elpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599838; x=1770204638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u1Qm6tXnDfkhnc+vPFBLjvwAKO1y0Lkh4JNke/KQIEE=;
        b=BTPKQeiCe/IhAgJ7Y0X2Ov+CAi8W0LYhEJ29FplSFZcFgkdvdinkK2zifPCbGYQcSF
         kNhrBA0aC/4HCtRYq3OgHX6TS0uMxKkAIPv3FCGCE0yOqyR/HUBlxmFL/3h5au79szu9
         1Z1CVAi7VwsP7l415nK1YUjtuPgVYApH/u4CDf4QpLoZvV+hAuNkTQxKVVs81BE5+odS
         IRVHD9g/Io47aG+HBmin1MhEl0lXEtOsnoPE4Gl1e9rgRA3SVHhEGKRdBMfiOV+LSBxE
         +9dVK8Le+uwKo6yRDOcKLtzoK/10yZ669holR14rBDFifr1/KlNYaRpdp4BfC1bPDsI9
         prKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6HamhI9gzUdeIKL4IzAaW8EAVSffYbIEzj/h48mcrT1pvHljWW8BJ69PRfC8kQIdsid6V1nMmZVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ryyxqn4gEqxGcliUIHJnixqgzDj8QFuA6+wppAwLrBVvQdH6
	7KxI4KVqzNEgskDJnoshGSfKfH8tuZMIDYYc7iXdwajpjl0wM80040gL
X-Gm-Gg: AZuq6aKA2KlTNvdksN6aUgslVZkqK20WlpusKeP/vFOPYCUHT9Wvg8+wRk0oGqacFFp
	DEyljO2pVX95rNoKWkTAw1Q7dxsAiHn9exXhnBbPeNl2p6zZUi2FKFgZD0VhaqfnoJid5bViSzi
	FWE42puGsnebAlhMnX1jP1Dny1E5Q0TLFzTN8jsQcRAWOTlWXWXKHDkyk4TPjvEYkkIoiVormou
	2NOcxS+hxBFhTzgJLFBsm+Qm6SysmuoPiicGAZ+zxjLsiH4wpaPqWB3OEVyxElJTIrt3DyeV8E3
	a7oKsyYGd/bCDK+uqEJY3xUJIcSzYPLHZpx+sZbu1jxUU7h1F483pJlFo1j341EXwWB7Q3qQKCc
	XI7SAJUuPx7sDxTDCcuhiJgzMw9ueCQpPzajAHdXiNmgR+JvfnlR1dHrXLV2p2RqxXsuMCCYumb
	Fp0ObRAX57K2Gf+0zhwTaImckI2587IBfPLAc=
X-Received: by 2002:a17:907:9495:b0:b8a:f225:ede8 with SMTP id a640c23a62f3a-b8dab2fe310mr355691966b.41.1769599837383;
        Wed, 28 Jan 2026 03:30:37 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm114400366b.46.2026.01.28.03.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:30:37 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 01/10] dt-bindings: dma: rz-dmac: Document RZ/G3L SoC
Date: Wed, 28 Jan 2026 11:30:20 +0000
Message-ID: <20260128113032.337231-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
References: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the Renesas RZ/G3L DMAC block. This is identical to the one found
on the RZ/G3S SoC.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tags.
---
 Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
index d137b9cbaee9..e3311029eb2f 100644
--- a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
@@ -19,6 +19,7 @@ properties:
               - renesas,r9a07g044-dmac # RZ/G2{L,LC}
               - renesas,r9a07g054-dmac # RZ/V2L
               - renesas,r9a08g045-dmac # RZ/G3S
+              - renesas,r9a08g046-dmac # RZ/G3L
           - const: renesas,rz-dmac
 
       - items:
-- 
2.43.0

