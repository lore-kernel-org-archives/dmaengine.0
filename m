Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AF2390985;
	Sat, 19 Sep 2026 22:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856568; cv=none; b=MMFcL9JD3dmPOMFlVn7DzNymNixiEvTwsuAi1NVKDsHAGFY+YX5uFlPFwuCsneBUxcLoipP+u16csiA+WwxzcgS7V0VRU0NsAo9qohPtsQFKSQXEyp3muc7NMqgJbSGjno7/5/1wx/ksF/rmErYibKpxf2SaoOgAYDk997WQNhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856568; c=relaxed/simple;
	bh=pKj1W4qI2rrfPn19HG6yQq3gkI0KmQAEQkEz/TvI5yU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MKmJw9P/0G7aNpT8fxV3VfNcuoovWqyIawwRXm5Q2rwsrdqcJLY4dj2Zf2eCG/WASVBB2G0a/pBrJ2BSNPtGahBXjt8M+CeqX60XKmlKFhV1wG4q/o5uMIB4AEfdAO9K5K5FBWFqhkvjBKHU4FCPVIXot3+GAYxq9ObY6oUmBRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpK5pKaU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpK5pKaU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01CA1F000FF;
	Sat, 19 Sep 2026 22:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856567;
	bh=PPZEscezJITdHvsg3zgWZgWnfR2w458lnBC+6xehPv4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XpK5pKaUmCD3bw9hYsCoq7+BJx9pS//UIcXgJzUAbT1oekVywMWxuxNUGeLgEPY4h
	 AQvM4AC45VJlpIzscvnyZwJgXfYwN1/fNE3SirV/9cIWaS7VEvjLDZ8+1e0JmQHgSw
	 eMSLCzDCRH4QP6dhPXdJCL84yJj9j0DW3RpeAzTdEvD7Ol/kWpiSsmcNrrDA0Y0DV4
	 gPa1wuZ/Lm70dHlGhbwFTNVEJI+Lzp+LC+Jb129Mwl1N/I5CWLPOI+3Pv6gIVgGpOd
	 kTtt4ooyyHQC5QsYYEdRA+rknFieyX2g/ASUuD+6czZrOAg55DwFaJ5qgNz7wMzeV6
	 Zs4ZqN8GuQgJg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:28 +0200
Subject: [PATCH v4 17/23] dmaengine: ste_dma40: Validate DMA specifier
 length
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-17-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The DMA40 binding requires three cells, but d40_xlate() reads args[0],
args[1], and args[2] without checking args_count. A malformed provider node
can specify fewer cells, leaving some of these values uninitialized when
the OF DMA core invokes the translation callback.

Reject specifiers that do not contain exactly three cells before reading
the argument array.

Fixes: fa332de5c6b3 ("dmaengine: ste_dma40: Supply full Device Tree parsing support")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 28e68fbba1a5..7cd063e81328 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2516,6 +2516,9 @@ static struct dma_chan *d40_xlate(struct of_phandle_args *dma_spec,
 	dma_cap_mask_t cap;
 	u32 flags;
 
+	if (dma_spec->args_count != 3)
+		return NULL;
+
 	memset(&cfg, 0, sizeof(struct stedma40_chan_cfg));
 
 	dma_cap_zero(cap);

-- 
2.55.0

