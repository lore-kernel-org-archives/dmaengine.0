Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ACE442B25
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 18:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496236; cv=none; b=Hs+UCs1K4cjrOQKWj0wApHMfuP9V87ijnphyILtcYLoZqDrzdCo7wI35MTHARQtkwA+fikegLg+wbdP3l6tfyemDXrwvyGrOinJ/EZWzxgS8wb3ccWOSVf0piWekWSlWyhbrgLs1VCCuBvolPARXoWGZL527hDv8VQNBiP7KiaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496236; c=relaxed/simple;
	bh=A7in0Alu7BM8kUxRkWxLv9TvBfe4QvgWoOD+yHVx2j4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CIeVoN3gK6LnB3IoUasECpL1zaXSAj4WUPoNblgr5jurItt4bIRNBy0vDIL2kZh6j9Xr702O1/xIBVtaWMMRNynUJQ9Fe2t41+9FicHBWvuYEo+kq7qL+AiysVCQYAl2/VcgvMIWxxXZR8R8esuDuAuFCPBNfgK0ZSA68iBBjEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g//yLgFJ; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g//yLgFJ"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-785692e5a3aso471137.2
        for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 11:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789496232; x=1790101032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lhABGOr78fp2q20gHs/L/QQ2y1BCAwuXhlRy5NO8sA0=;
        b=g//yLgFJbe4+i6+NUjaUGafxtqFGMS47x7HDcC8tenhLuMMEtX44pOpIpENyfN56W+
         JbQIB8oE8sW2RvlHam7BMD4bBTgl5sG4dfft6v1fSmIpOtjnbq08BaU2aWUGaG8+sGci
         YMovr2qcVyvg0Dq1zf2VW/2Xbgg3RJLMGwUBy6qtZlApLFavfdutJE7D7NhwuJ7xda4d
         1qP+uen6AICgUBX3eH/C6NTpnlwrUY51+V2GgySSWJ4vbnxDQ2AUv8TKD24OtM3NKLMn
         PWgsN8gUQi5fEy8HnE/X1qW5Y7n8z/rpJEQYg/usO6Q5UJPQ9KGB3+wEMY9JYuXFg3gu
         pCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789496232; x=1790101032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhABGOr78fp2q20gHs/L/QQ2y1BCAwuXhlRy5NO8sA0=;
        b=BSBfLMwcLY24fBJnl+V+M6uLblN1/u0mdKVKlVBzjuLF6Ysjf9Z2GBvLyYWeCBSyv9
         C4SioY3xt6Cxo/MGaddKhIA9S22kIrM5EkJxTBW33QWwJePRjRNamopF0ku4E8AaoAfw
         BlGF3XC1Y7/37IPy7jAkLdCFkXqYRlghhbaEmpc2x4FzMcic2CDI1tD9opuyIDxdcNBz
         g3iAw7ngoyQrprNOUmWq96qsf1b2amO5QsuIj9b46SvYYSW4povnltJ+E/p0CR9rfUpA
         tLsctK5KURDnEncYfQQZoTTZuH6Hc9TTLwXRWJ33Jz8PzxexhoOALJ7dibA9J8Kq72Cr
         vZOA==
X-Gm-Message-State: AFuF++lOqMuC7BlHLRr8c9jxg73xaa3tsIlwUdUEdRnrwaWtm1oGnqiE
	1m/EOnf/58gPH203T4ip8IW5D2MjEJS/UIySn262sV8DQieSLneUoy9aOAclP3cB
X-Gm-Gg: AYBFou1gqowzHBjEMX5VV5Psw/WLFYn0KGOFgooC127jam+Mj/o+uFKp3jtP0UziBDq
	Z/S7WC0q9zVPN9G4t5IW0WcGMOJhf9YR1JAd+AJDZ7d7FrEqO/30o1FvOAc6ji4Tpz9mR98O2ub
	963Mxcc9x9DyYQiBh6migBHxaMKZOhbXFbbxqb8hW5XA5duGaTZ0VNTtxXYRL/YwXH8Z/yWLjXA
	ILnPQrE2LXbUVP8YKgGAXrYZxGTh+WnAqPcQoQ+Ol3SBgIwjlbrywLAuwOgYrMTDk5JJkTotCq8
	Uswslaxx7aHaoIy6XZgwyed2oI8GL2779yDjvSpXVQUnl/Rsoy9EYTvSX9dnXw3eQB2OIZhpIJk
	TtWx9HRR2isZ+0LEkd3U6aptNfF7hJ3IPd4OWMHnr/PE4fQ5+RsJ9ECM+wZ3lePWzwvQC25PsXe
	MWCfPj3G0FOtO5MygI3hSJBjhxEPDGx38n3Gn8RO9Vsn/lAZKi4MZvJeW3cXWF4kpMmlXxgnq62
	khtNWXk1KYi7kvqxcpBBE6VpCwsjTb6Weqr6AIh4aN3O6cDuY5GVTJql9B4KjzF+fPIMsNy7EcK
	7pVPc3m3parBqw/4r0LR0krVfuWC5DTC9kS3hl5BB6IXZU8p
X-Received: by 2002:a05:6102:6a85:b0:79e:221f:704 with SMTP id ada2fe7eead31-79ed4c2905dmr5071549137.7.1789496232542;
        Tue, 15 Sep 2026 11:17:12 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be5fcfasm4717636d6.12.2026.09.15.11.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:17:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list),
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...)
Subject: [PATCH] dmaengine: bestcomm: Enable compile testing
Date: Tue, 15 Sep 2026 11:17:09 -0700
Message-ID: <20260915181709.11323-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the BestComm DMA engine to be selected for PowerPC
compile-test builds.

The freescale ethernet and sound drivers now need a dependency on
PPC_MPC52xx as they use headers/functions from that platform.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/bestcomm/Kconfig           | 3 +--
 drivers/net/ethernet/freescale/Kconfig | 2 +-
 sound/soc/fsl/Kconfig                  | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/bestcomm/Kconfig b/drivers/dma/bestcomm/Kconfig
index 5dd437295964..153b5492c93c 100644
--- a/drivers/dma/bestcomm/Kconfig
+++ b/drivers/dma/bestcomm/Kconfig
@@ -5,7 +5,7 @@
 
 config PPC_BESTCOMM
 	tristate "Bestcomm DMA engine support"
-	depends on PPC_MPC52xx
+	depends on PPC_MPC52xx || (PPC && COMPILE_TEST)
 	default n
 	select PPC_LIB_RHEAP
 	help
@@ -34,4 +34,3 @@ config PPC_BESTCOMM_GEN_BD
 	depends on PPC_BESTCOMM
 	help
 	  This option enables the support for the GenBD tasks.
-
diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/ethernet/freescale/Kconfig
index b34c0fcfddea..d81984fcec64 100644
--- a/drivers/net/ethernet/freescale/Kconfig
+++ b/drivers/net/ethernet/freescale/Kconfig
@@ -38,7 +38,7 @@ config FEC
 
 config FEC_MPC52xx
 	tristate "FEC MPC52xx driver"
-	depends on PPC_BESTCOMM
+	depends on PPC_BESTCOMM && PPC_MPC52xx
 	select CRC32
 	select PHYLIB
 	select PPC_BESTCOMM_FEC
diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 04940879dfd8..101bc952aa14 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -234,7 +234,7 @@ config SND_SOC_MPC5200_I2S
 
 config SND_SOC_MPC5200_AC97
 	tristate "Freescale MPC5200 PSC in AC97 mode driver"
-	depends on PPC_BESTCOMM
+	depends on PPC_BESTCOMM && PPC_MPC52xx
 	select SND_SOC_AC97_BUS
 	select SND_MPC52xx_DMA
 	select PPC_BESTCOMM_GEN_BD
-- 
2.55.0

