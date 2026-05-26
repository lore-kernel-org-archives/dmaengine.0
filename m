Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF5C3CB90B;
	Tue, 26 May 2026 08:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785262; cv=none; b=H0ZOhd0FuigvsENV3gtBDQmATNqRnwwecMHoMH5AcEOs1uqvIf9WIlsmHmY97+hbEVtYv+nYXCl+OF82jy+nEGbk1j8Ndb/FSwMwhl8fTP7FVobFVOTMyqjzV8+0bmmt4/GhgwW0FIY/r4Wb+W1vbuY+TA57eVmd9PlvVY+Gl8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785262; c=relaxed/simple;
	bh=zHOsvF3r8My9+a/blX5s4gYbAnSonFaADUYLxSO1XtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ffoAJvbMD+JcVXtwFWquxX7Ji4tbhwPVag/xk7f5hlmvMowQcyrw/Nyhewh4J/qovUSxkk3y1AkcLEI6YIMzEaXYRpMUuNLzL6Q98LOjFw/tZPkihznZxNCnqm3mZL8y0Y8M5VGSC4rjga/9ZTazEzF02s+QnCZsuq13BTxMe3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ak9C+P+x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ak9C+P+x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054301F00A3C;
	Tue, 26 May 2026 08:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779785261;
	bh=h/Xo6c7rA6ZkqK8zsLmYgGZUvj28siO3yG2ezNiZLmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ak9C+P+x89kPXgciryi5UHVEy7Tqw8/8AWOvEYtPMpsr8ygDEpunPdu89SkVtts6k
	 2MxaOeR2RpdMdjBD5S0yGf9nlsxiTdMB7dK7Mam3SdHf8VTNQXBeI7CJCB1py3xcjd
	 enW1QeESDneNffDzMAKU6vHoUcqWGb7mnlAJCtiVanGtFeD2AcmZWOeiT+STXTUXLA
	 SrKuP2UG2QKFzEnWwMNT1sAqDYqxEoErtwLc83JIEMXBTEdtJQRuOlrYQaSUB1RTge
	 xY7KOPciDybBxKJDs/Mg9HVcwEZ0VZSMk+k+1A7gzAQmddwQWgvsMNw0GHJCKs/CRM
	 IEv3m25hFad2Q==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	long.luu.ur@renesas.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v6 04/18] dmaengine: sh: rz-dmac: Use rz_dmac_disable_hw()
Date: Tue, 26 May 2026 11:46:56 +0300
Message-ID: <20260526084710.3491480-5-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526084710.3491480-1-claudiu.beznea@kernel.org>
References: <20260526084710.3491480-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use rz_dmac_disable_hw() instead of open coding it. This unifies the
code and prepares it for the addition of suspend to RAM and cyclic DMA.

The rz_dmac_disable_hw() from rz_dmac_chan_probe() was moved after
vchan_init() as it initializes the channel->vc.chan.device used in
rz_dmac_disable_hw().

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Tested-by: John Madieu <john.madieu.xa@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- fixed typo in patch description
- collected tags

Changes in v5:
- none

Changes in v4:
- in rz_dmac_chan_probe(): moved rz_dmac_disable_hw() after the
  vchan_init(&channel->vc, &dmac->engine) call as this is the one which
  initializes data structures used by the debug code from
  rz_dmac_disable_hw(); updated the patch description to reflect this
 
Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 1717b407ab9e..40ddf534c094 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -873,7 +873,7 @@ static void rz_dmac_irq_handle_channel(struct rz_dmac_chan *channel)
 			channel->index, chstat);
 
 		scoped_guard(spinlock_irqsave, &channel->vc.lock)
-			rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
+			rz_dmac_disable_hw(channel);
 		return;
 	}
 
@@ -1000,15 +1000,15 @@ static int rz_dmac_chan_probe(struct rz_dmac *dmac,
 	}
 	rz_lmdesc_setup(channel, lmdesc);
 
-	/* Initialize register for each channel */
-	rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
-
 	channel->vc.desc_free = rz_dmac_virt_desc_free;
 	vchan_init(&channel->vc, &dmac->engine);
 	INIT_LIST_HEAD(&channel->ld_queue);
 	INIT_LIST_HEAD(&channel->ld_free);
 	INIT_LIST_HEAD(&channel->ld_active);
 
+	/* Initialize register for each channel */
+	rz_dmac_disable_hw(channel);
+
 	/* Request the channel interrupt. */
 	scnprintf(pdev_irqname, sizeof(pdev_irqname), "ch%u", index);
 	irq = platform_get_irq_byname(pdev, pdev_irqname);
-- 
2.43.0

