Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880343DDAE6
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027808; cv=none; b=eocXUcNs1mcoZMIbtdXJdtP6SC39tmqTBM8yTuQxtc/Xzi9fya+st33v7VeC2OGZne6v2hBnDiCIP7y0GPpoWGZWoi23LrwzGg/TL0tFI/fcLr6z371N3Bv+SJTlHghyClIS6sQUB7Ffle5vL9+mlDULrEm61n9KEbTniyFqUCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027808; c=relaxed/simple;
	bh=s4NszV1LAjsfPGh2AYlQJm8DMiRBqi3Wr7v2mRKxub0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NZV4NC8GTzJ2VHqbLpYobgKu80ZXYhiJ94zFnwHWle7m50D0lYerDokUgZKern0DmEQOCItuLEhQ6Syw1xWXnpcfb+SAX8nI00DULwr5KPn4u07HEmkWx8aZUAI7o/O+iUiNXaSsKBG2jkMnKJli0MZijrz1AN+zddVPTUNvBrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qf5Emd2J; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qf5Emd2J"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-855d2bfae95so275366b3a.1
        for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 01:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789027806; x=1789632606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcJ7z7pjuPgGZIi0pC2sSQMK73f03/U0vs3UawuRDsQ=;
        b=qf5Emd2JeT6IBwXAYGkvz0jc3TiiP4bk6tdCfF5oHMSzX+0rhmVU1tBbXOheFTFYyF
         CLkS+3tO0pVVC3ZPuh4GFjvFRU5q++nKZ8pOwwQstI3u3ZvcmHgbLj7IKc4jiHm3CsSy
         aRJxuIZrg6xJifopMjscSVoWCkc4a+tU2Ysgcu1OF0o3WSI0RqHNR2TfJYe3AvkjOdrv
         vNu9nuK3XwXqRekgl4qvgIGpFXuq1j87W/Io90SXVl/tcJCkkyDm3lKyuAm4P6fsNa4u
         tpAS886GcuPeUMMZW/xrw+Uy+bHsbui4yxo6W5YR+Jk2ZowIkqae5Tiax4AHZQFegCIu
         x+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789027806; x=1789632606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcJ7z7pjuPgGZIi0pC2sSQMK73f03/U0vs3UawuRDsQ=;
        b=BIyllYx6PaAtj/42fwsyXef357ZS7QFEFR2MXbtz9dGTRbDyXTmMWayg2EGdTHeOv5
         /BWvkW+JKXCpFyf65D3JcwfWInoXyFOtcShxLZwcWK4PKLcLUVpdmuftcbaJYERCxGFx
         ++2raYilC4VqMMlNuZ6SZkTgTs/Y6Nw4RJXiAOcvd4QTJd9lVzom0VE8RiPji2hdY4Fd
         1boZhoR3soiValJtnXq/wSlZxQUOdazdfYuWtTvkCRP7uR0GTYScHJGyh3o9ZBSv0jj2
         /GFlknTEQSWi0QVBagnZ7GPhrXbM+N7iL+vS5x3HguFXX+tgrbE9El7EkACm96Gov3oW
         y5Eg==
X-Forwarded-Encrypted: i=1; AKwUvBzHbOM0CnauZD8h+EyLS8pLeuy6/n3UKANU0b5DYvnlea8+DSxnZGJC/YXETdOUq7wAg7jpGmSIgJs=@vger.kernel.org
X-Gm-Message-State: AFuF++lcK08+nscjse1nmAYL4LwtHD3KlK9mG1V1BfRIGkUhRN9c0gO4
	CB8akDjDKLeuMPgRVFYIcm3T0CMYAoKvzDfLm8QxOCeYKnzrM7jzcin/
X-Gm-Gg: AYBFou07DgAEd3yyvpzYCCgDFnKiUCbU8thbk3pvDvzCnvpYVTdo7tD/WEwwqOEIK6P
	/FuFBz96NRMln1a757/BrljEpXvyoqNC1yeDl4mv3F/JL0cqEuf/684rC98gVWXGgPCRnMs44ua
	BOussBAswtkE/aEtni08bBLFT+zCbroX6WkmEWonJ3v3FZZzESG4PuQKp+LLmTwiZdKcNeTWB35
	FQwnSDBUE//XMhlEUq5yNF4BS3n72VAGyDII4wv2uoWiS+fTczmpnpJOLM7LYjG4He+59CMzAuE
	1uiJoOn1Ic9hlNKK6kv1TtBreUhi8dRZNeHex/Ug56sIcXgdvcvOpO5jVTD2vrHMMizJRgG01fC
	9o7Lf01Be2LSs+oYE54/KA1GAvjdF8fPki7hUSEfjp1bngfCeSuq2oK2Fo3eW73iK7vq5AExxyA
	c9MK3KV6l3CSIyg4RwR4TVkG2Z320Db8bmOBcYEA7jaryomfqub9+dodlMHVabi4wnKd4ZP64CN
	VI=
X-Received: by 2002:a05:6a00:1f0f:b0:848:52bf:4296 with SMTP id d2e1a72fcca58-869b2f90564mr1570548b3a.15.1789027805617;
        Thu, 10 Sep 2026 01:10:05 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615204904fsm7832757b3a.19.2026.09.10.01.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:10:05 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: Eugeniy.Paltsev@synopsys.com,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH] dmaengine: dw-axi-dmac: demote apb_regs warning to debug
Date: Thu, 10 Sep 2026 16:09:56 +0800
Message-Id: <20260910080956.2342267-1-shoubaineng@gmail.com>
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

