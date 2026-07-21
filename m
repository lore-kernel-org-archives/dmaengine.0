Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5C63644B3
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 19:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784663666; cv=none; b=HoENWswL6Ubgs+ewNeTeJ9K+KJk0WejWDgI8TRrSc2rCoLBBZbru63BWWMyH2fpxdR7TlivZK/cZmRjSvi7XiNqsib7QRV2m4NgIxsooHYTODuz1LP54wvgMpnH8B6Fq3WV5Nhxvo9YQiBBmaAA13NxNfvr5NbxaqqP7vgJuHeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784663666; c=relaxed/simple;
	bh=9ND+x+rjBFqbwddq0LX3XjFTd/gsf5VoW4hBcgX+Vag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XrHhEzxwYNxRA6z5L5LLU1w7hzge0l7qySXjhNP4aP3oehn/ii1lj/lWCNDw/g2t09qMps45KwlGkzOkW2snSFzmvpDgGwL4HwnOO40IkJCloAfMgwsrbjHpQD1M9UCzRsdCWQ6Kh5U1RCfBEVZLHIfEi7njMPX2ism0b4vgiGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9WYaMIW; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9WYaMIW"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so8341286a12.2
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 12:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784663665; x=1785268465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xCiUIr3EsUggj8nkPMM1tFkDFI9E/UOyOf2cKqUyHEY=;
        b=Q9WYaMIW+clKyEJSQvgi1kb7+sUd3z6DrabM+86NGzia0LKxEXNsr0U3S0L7pzNwtR
         SuGX/mr5IOuivskOZnWJJhX6kjT8h5NR2CWnz+yrgT3mU1Sevs3/cBK4MtCiiNgGJGcJ
         S5llxLvSZRiFqkXZ3bKCEnzGboy8fq5mIJ/BVFraPQ/hYerb14it4bTIYsyoKwN/EQTt
         p5ibVttZyijFF0P93WrZCJkDLgakcnpeeOqVF7IRjLm7FCvX4LyLemFUCL3vZa8sxB6e
         iyN3hlJ+xrdvKqAArR/Yi/rSm+HP/YdMedYcglvuXHSSK9NFPxyUN7zfK/yRRnnbzhoE
         p63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784663665; x=1785268465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCiUIr3EsUggj8nkPMM1tFkDFI9E/UOyOf2cKqUyHEY=;
        b=AYqeEtPWM2YkNm8ARGMOcY/+G7DBC0lLHKDGixNhTd36glpB1nP7JksbnyLUbptlC9
         8ngIXYSB3XGQrMteo9aRz1vDR1b6Ep0fRgz24W6b+0HLgxoUdPCPr5A+3nHLMQFJU7vt
         yub9Id3Zv181r1OnO8n+1+U/1pROnsdtz2vZagHWNA25AZvAuBbyUvL0ixoPn2HQxX0y
         e1Rqtwpvwu8mTpzfQ9FZBY8AphdYaR3oSkXaL7xLQyuYSv/rEUwGTrY6GP2fOCO0JObw
         6o89KNfc6cay+aok6JX6RUrvSBDexqADiXidtV2B0LG2sME690Hss7+9ucZxgXYzP0w8
         hrSw==
X-Gm-Message-State: AOJu0Yye9ZjdmciXADPzlZeqTG87wmoJO0/zfEvA/hwCQBz/rUopuIzC
	jwJj6MB2yBOpXGiZNkvr4iY9WuYV0eoFUPUm4mtXYUvzYMkdKH5ZgEKUnb/fFQ==
X-Gm-Gg: AR+sD12g0aXurOXRsR4iN8g/4awxWkFQOZgMMhRL1rHShe4DhnkWJTaEg6y5D5UJfpI
	WSFXitwX4G9V+gl52Bz/FK/vVa26JnVGM2zVCgOllemwYbBKI9UrfBbplkRn0qfMtCjpPUf5L11
	NfGMDRWY1NyG4J04A/0yfqtoIe0yJ2pLXKCC/Qf3levL0LWqG2T3CIdY6Atzqc4WMDmsn00zPcz
	HtJGaf451M8v1CxTlIuf82yk7AuMoaoM5MCshZFJSopc682OcFsy0zyUVoGajGFTHusE+5mDDj+
	E9PDRv4MSKTOrUDC6zrFPOuKHgmWC8XY5rDjTp/i6ZDR2JMBqloL1RTP0H0xnOsE2bcahQmN4SN
	SKcnltCCOpXgm13Gukp7U7obhZIcq6edt6sBANvpAsowtDtMhlrMTHfvtPDd4/8temtXcVj+fSA
	AU9+4Pp1JpjS3BSVKagGOFNKL9VuzfFik/NViF/be3s/sMThu6xT1L1WreioNa8BSlb6DgqMjgV
	k87E2GdiLJfaO0BUTEvU1GypO0twMy1aDw/rm94fSU0yQ56sQK3w+I=
X-Received: by 2002:a05:6300:95:b0:3b2:924c:567d with SMTP id adf61e73a8af0-3c3ad8ecc0cmr21802839637.46.1784663664608;
        Tue, 21 Jul 2026 12:54:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc7d8fbsm1664595eec.10.2026.07.21.12.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 12:54:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 0/2] dmaengine: fsl_raid: fix resource leaks and simplify drvdata handling
Date: Tue, 21 Jul 2026 12:54:20 -0700
Message-ID: <20260721195422.353794-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes resource leaks in the FSL RAIDEngine driver and
simplifies drvdata handling:

1) Replace dev_get_drvdata/dev_set_drvdata with platform_get_drvdata/
   platform_set_drvdata, since a platform_device is always used. This
   avoids taking a pointer to a platform device member.

2) Add missing free_irq() in error unwind of fsl_re_chan_probe() and in
   fsl_re_remove_chan(). Also add tasklet_kill() and
   of_platform_device_destroy() to properly release all resources.

v2: split into two patches

Rosen Penev (2):
  dmaengine: fsl_raid: pass platform_device to drvdata
  dmaengine: fsl_raid: free resources in probe

 drivers/dma/fsl_raid.c | 33 ++++++++++++++++++++-------------
 drivers/dma/fsl_raid.h |  1 +
 2 files changed, 21 insertions(+), 13 deletions(-)

-- 
2.55.0

