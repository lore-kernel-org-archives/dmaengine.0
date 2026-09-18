Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2361A3D1A9A
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 10:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726467; cv=none; b=O2rGaQtR/v/EjL8KnwbtdSuIbbYZ6DSyfcT28L+iY2sJVjeoZMDajKpyDTnGBphxdSMhQFFMfwdPzOpb7Av0uioqu2ZRKIkUVsQ6MNwU07pyukkLf8muYPJGzqYFTj/ZNQbyZDIZFrAyl0SBvcTdYwipDOs+/n6uF4FLHrUNUOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726467; c=relaxed/simple;
	bh=s4NszV1LAjsfPGh2AYlQJm8DMiRBqi3Wr7v2mRKxub0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SwK7S0mMBRXNOjAwMd6d7vbJN+fuGfaschYdSXLwg9ir5a0V3xg3iHqEQx74TULm1Vs/MIAzSDqi6vq7IoMy+6p5n/KDvsirdYVKows0czVuk5pAUuZHCHtVfUOQWmyl1q2mhpGmiOJ7EcO0hDw2QBQe67pJ0hvxGyeTnGuPs2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wn/UYE70; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wn/UYE70"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5256c2a4bso313846a12.1
        for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 03:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789726465; x=1790331265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcJ7z7pjuPgGZIi0pC2sSQMK73f03/U0vs3UawuRDsQ=;
        b=Wn/UYE70WGMC4XpRoc7ZZplGpk0P5bHPkmfS8gdtwZHXqIE/LNfzMkWerVa9WgZd9i
         jvpY3orYt/jA64AcpieOJe2Pv05uS0ZpZT9eAaOjh2MPQVuoXNR8tzTHNTHVVXh8XS/K
         0ZL0js29F+JiXmevjXhSbNOrvn4MB2+Uh63tLcMfXxEiHeyC29svRHKoH2Y6I3OvpvlZ
         pF4boTi8nS7aR3mk6Ohp3TmlIdFfQbulgxIxObHt5coCU5MM2j/rUIl8jAJ5ivflh5RT
         TuoJ/XU92AY9XSNsPisyJQtgAHrXNMSzzodJV6+shcJMUtK+P1MPY6CYwAeUKk6fB4M6
         6tIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726465; x=1790331265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcJ7z7pjuPgGZIi0pC2sSQMK73f03/U0vs3UawuRDsQ=;
        b=eMt6vQCh10xYYa9pMznzju5Q3GW9mlNkZVlVOaIqI/N/W4GmkYKB1VctnevCuzS0gu
         TL7DXErE4d42qkuqP0qXuntTzE1FtEX85QVCO6Q8c7vW3R7ZGa/dp7ODpWp+0MS4mF3h
         anvRq1WyHWxEdCAYDg2dZwJ1Z1tOuJEWz9ggU/ImUB0gvbYITcJRICLpseW7DRvAZ60m
         5+E7tMhOGsTYY5UAU2KaV/nI6HdigMwhCuVZfuI9kS4I5zqLMFWkEQMKe4Shhc19McBm
         hSDJX0yIsdFSdJ1IU2EDumyVe+Dgp0lAiY1RR/bSltnPPl0gYoADziuPHm3FFb8ljhKI
         Jbaw==
X-Forwarded-Encrypted: i=1; AKwUvByRZdRE2JO6adniURhWePWVQWFAZ9wSi6OXLWPZ1KQFmRYCN5Rl7gv9A/lIEHu4dKCur1WXniCyA8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++n0HKPjndxAyjnc6w0xm+jDiNyabiaoo90IPCN1w4ZZEEAqHVUm
	BQjM4w5PMxg0ralQQ7+HSbZHZs6NMH5nexr95KlzbayVo3b9cbde9cSS
X-Gm-Gg: AYBFou0lshTUVf0yvYXqW1jKl0KoOj62B9uUU4EcHPBuh1KNlWtuR9jrEkAF0heJjAM
	Uwuo9pUuk7iEZ9RyadlvY3p4jiqIBQhi9oZUYJUfXF5f5PaLC8qACdDP63G2oXHb2hfbBCeal91
	fJ20SyNpxtQLVOgwT/bXi0fwgldSQZ4jWQbpTSvnmZWJ37c0Y6gzIZl6xCIyQ3cxWKjwUxvQkHP
	hNYbUifqlvBi1lAYNWMaPbo/v/xj4xblfUSxlCVTMp3skWKdBc8E5VEMzEpooWxzEFP8xv1lWvX
	0CgCoQLEi4wiBMUcak5/j/svBjUkdIVMCfVU+6sf+s8ETfn+4OIf0kuwfAoolOFk1zRrv7uw8QK
	E9bhaR0LkYEQi1iE2LFdYrEeO3U36O8iK4TGYmICTegLQdGeqfV1kQM96DnSXrGbLNuqSQfyxEm
	DSkR1rPQri6OTjouFIkmjL1NbdSbjXYhDYnqq9pPPMoFAYn2lIY0+wiijgamgNr2FnWH/f5MJDF
	imYsaLgMX9tgyuR/ySpl/WC1y/9
X-Received: by 2002:a05:6a21:6e4c:b0:3dd:85aa:4528 with SMTP id adf61e73a8af0-3dd8c501970mr4608478637.35.1789726465018;
        Fri, 18 Sep 2026 03:14:25 -0700 (PDT)
Received: from drobotics-thinkpad-t14p-gen-1.. ([117.133.183.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50e7433sm720513a12.28.2026.09.18.03.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:14:24 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: Eugeniy.Paltsev@synopsys.com,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH] dmaengine: dw-axi-dmac: demote apb_regs warning to debug
Date: Fri, 18 Sep 2026 18:14:14 +0800
Message-Id: <20260918101414.4104604-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dw_axi_dma_set_hw_channel() logs "apb_regs not initialized" at err
level when apb_regs is absent. However, only Intel KeemBay
("intel,kmb-axi-dma") carries apb_regs; all other supported SoCs
(snps,axi-dma-1.01a, sophgo,cv1800b, starfive,jh7110/jh8100) operate
without it. For those, reaching this path during slave/cyclic prep and
terminate is the normal no-op case, not an error, and the err log spams
dmesg on every transfer.

Demote it to dev_dbg to match the identical check in
dw_axi_dma_set_byte_halfword().

Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index bcefaff03b5c..d829b9af5491 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -574,7 +574,7 @@ static void dw_axi_dma_set_hw_channel(struct axi_dma_chan *chan, bool set)
 	unsigned long reg_value, val;
 
 	if (!chip->apb_regs) {
-		dev_err(chip->dev, "apb_regs not initialized\n");
+		dev_dbg(chip->dev, "apb_regs not initialized\n");
 		return;
 	}
 
-- 
2.34.1

