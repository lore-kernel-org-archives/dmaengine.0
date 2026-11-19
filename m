Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.82.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120707;
	b=AshZJ7m07u1FFFkcNcsQY5ULGZjALFlssJYpH5L7D8qEUtty1CWZZ+YFpuJXar0TnA0y
	 KdH6h+sZDRDPb65Dw/CvwdGZ8yRQR2qrmHjllz5qekq1V5jNTQin+9NB01UrOv7DRyrJ5
	 CSG5lZ0LlzM9DVpBGq8TPd7PSjyF5HHOuriPwyGoEYPebO6XNicqVkvUmmksZR6VJ4nL0
	 ZaSBwHK6m6CFXs8g/t9PH8TcS3dJIvlS4Rp8VIX5o3wfmWu9MYVmwbZghZSiTPIszrXL1
	 EgSWOCZ38ho5mQosMFic065bp9TIMmC8fsh7xXYnIdH0yrPZNx0xWL8BtuW6stNq6vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120707;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:X-Change-ID:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 References;
	bh=7a5KXBMGWiXvI5h5MdzscclJ8kMFpFBavCEcOmC6V0A=;
	b=kkNuXoiDxhHzuxAiBWANnMwiFqDY1S8epBOZTDOjXMaFSmRE31YXpxhE5zOxhAwiikdj
	 g638JA03TfASmTRHqS315jC32CQawEowl4eHcHgcriGtr+xNUMA/GA5I5d09ePZlY3ha0
	 DT6X/47ouOA1TlQNl0ZZpE+xbiD+I8oL/1OvCOjgZKGhcaKHBe+87hS94GkiwPueKEjAr
	 jpd02A97+h7hUUQFNyCwp8/Wy5QK2eRIX3EJRkQg8PsU8Gs7N+Z9kZ6jlB7qNBqUNUMXO
	 o79BeDhNHs7oTxQ3BELmRn/YlwWtH/PL1ZK2MvZFyYEmVqXexZacE9VkZ0soJ7rDmoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.pl;
	spf=pass smtp.mailfrom=yahoo.pl;
	dkim=pass header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=OkOKZ+IJ;
	arc=none smtp.remote-ip=34.2.82.16
Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8C2606A900
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 20:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF8C2606A900
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=OkOKZ+IJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1795120705; bh=7a5KXBMGWiXvI5h5MdzscclJ8kMFpFBavCEcOmC6V0A=; h=From:To:Cc:Subject:Date:Content-Type:References:From:Subject:Reply-To:Content-Type; b=OkOKZ+IJdgzzFgottAwZazfgP+cnZcOOZ7Ou1uiGiDH683jwSlFgCddSDUt7cCXeyJUulnl+lIhCaB/BgDpyB/4IFBMCdFWy4qHYoWkHgNTOx2biejQILph742uDNc73WhHT+Iz2metnIW7E2V66fur+Ddr1W06dD6KKwTcrUkbt0Fjlqt2OyBbA97lctuIsK8vNS304vX2aR+SQwRd6YYYELpJqZe/2HVgwi2QdQg6VfseTqxKtogf2lUvZuoN5b9rkk+5b4JT7Lm6OTQWQetB1pkGPlhi6/ZkTw6OGbEoBbnJ3kSZ/vLXAzUkWd1b/q85e5sotgTfLFzzk7MUYlA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795120705; bh=o4qZVizyGGrgzfXgUFZfzs048sFhh93+J+2tql5WkpS=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=lLJADHEf4+b8aBmFa97ymqyUQ81Qnik0mm+g+rzXK7mpn+HdMUNC4B1gdzExoX1g/9xEMOeMbgXar6uP4qQSX32XeefEhSdsHprg6C3S+tSPErWOJutS1OTmaQLsU0l1PoF6zHLXXID+YqOHvBjpb+BAPcjvyVlGRunM+Stlf9tDw95uxoBKrLVts5E39Y6L4Zo0e4LOqv64/mS9lzALepst55loIxy2gdRCad/U/tWJZq3Vml1R+ENVywLO03PodHM1CSmie3kxhhVBlgL54wQiTdv3iJ5zdveuYgVtyiaq99yuHv7ji0qiuaWrW3jrCo8fwBvntwBoDgODmJJLgw==
X-YMail-OSG: FXioNcUVM1nhCns2TFMtRc2PlWEsl9tHr1LPfTj0VdXmb2EUFN1FFEIhjndKpC0
 pfdjYFejpACyHcLBbs609N3jBTZj3X9HunCVCo6lm_TqoecdhjlT08FQot2YV6YG08g.pUlLs6fJ
 OzHOtH6GLJLlml1fH6K4SQZiYZl8znZPbgZOwzawXeBPMwnbV4NHADjHTZO4wrKrz_grqVQA7XBu
 EJtM8W56SXhFJD5hFYP1tfcDkO9JK0FROHXyJd6oPb_JGNp7B9xFiZ58p5Ag4jnMT3SJYBGRZ6bJ
 1sn4sOz2R9uygwvYVzh8jGqe8X0A9s5Y7RaSM7EKUJdWheZ2wYjnhqxjMuPyH_vTi.dqkosBafnT
 wVINYlIx9wcjgDunOYEACs18zVYOSuOyK8Nl8D7NrI7Vkaaf4QaX2lVB7KHZAItC6r_iWKdp4b7X
 poqWHg8i0vabympImo5TQGBChTgcequsfPwelbBgSJBc4Xt60v5qaPKDrFh42CmMnj7Ow0Jvfw4b
 dLodFIMtvY9Wth3MNB.Ks08epauEOqnuaKZ0G4DbfPXj4f3LrxbbSFehoDoQukVfxYJA5y5JglDn
 ZK5W95vJDVihJISmCps8KUOjGigdZKKDcery0xd_UrnLr9y7KmgtlFehhOt9a.4mm1xt5Ev98Tyx
 Qw1SwHB5O.OTeSv_j7E0mjx25IglL7IFLJZ.ed25yWNj6AtqOlaLGiGyJ72ZBAtFZgpdlUEys73V
 fk_ORHe6s0fdbD_9TrqqZPIpVZp8E8BqbVgZwOBX5I3u3dHhA0kDIFZojs9LzC47tMSXiL9IO6eT
 UnOPkPyLbj54X2r8gYB6ryzVmQpYsPafnRlkB.Ze9JtmPmUTLyhNpl8RPyev3.KrGqcQ6_XnASDi
 df3IAWTnV2b_c8D44ujReAeGbcgeSaNTxL07rEN3ga7K0YXfwMjAkfBeGSZE3enqZ5SfyYdwGBHp
 NglIMveE1bnf.b2NFTlC7ozgVoJVvX3l_4F98MVKvLC94Yu9xsGERrZmFbnbv5fk7K1FrdtuDq0f
 N.2RgENYYpEgDBuCpPK49WppT1Kbur0OkV.tZLjS41tLd9bRYPKkN1W712jTxRFJkfjhHFC.nhsS
 QZAjftlKnGnlijMSvkIzfHRY_bEqVotyQWb77NYoaYXXgvBL_C29Lp8FkPMfjMKw1uQc.bVQvrFN
 u.Z0rtqQ5okHbdB3v_rsNDbDA9mddNM71yS3gVE2Daf.rSzRYF..TQ3.jOVUiwumo3lmBZNCAQ6c
 g0O7V0i9lkKBUfJgbnmUHfSeEb8jLZbHJzIf.qAWqHkijJm2wPK_apc48MqKQvN6vi5wvylPTo9P
 kVOUs0Pu.Gd.iqEc4dDMbkRI99Y5AYD9CoYRfJ0LaFnMyeK2y1D.FlofBF8pnizai7UtrJisBkYF
 77QNxVt5bSdMG9RvG_ZAw6nF_1meRSmeZ5BL.SWTlRj_pSPExg2kOfxD9pmFpyn5D2g8Mob8mF8W
 wqFQqmNkz6mAE9YQyyeVuqtbg0CQuGpPWslmknbtSPJSbxLTKY7E6Nf1v_OKGSnpBaZ4uMWyxIgg
 BLDdm_ft1tt84wgvft5oKx1Bg7HrJHhA5YQ7PKb7Fjkb0HNII5caRtKtj0MCxuwZLIjn6WHOHgXZ
 qfPUO705sA075RjeaUxYdMapJTLskeF.pDZZr8DQ9WaiH8sqUPQV8alMJ6y3Ib3DTGlBoYIiofhV
 VvIPfqymUeIlC8Ik_G.pgB2tnf3Zq7EZRQe39Vz4GgudbajntU9obUxAkP.bWv9FxmVhbsgFcDmA
 KZqJ3dgyFP43qDrOkIR26qJCTOM41Wl8xnBnFhjI3kVGjYvEch.xm2VTH.Ml.2AMTcC98vnyjzow
 hYpKbmhLpSoaZTLZBM3LeVBTvq.6WoUH7dY18LEA7hyd3CSy5kOZF89dGJS.KPnLintLOe8YAJrc
 uxcmm3Oc3x10mXyVBdrxqMYL2DWgz3r7lsogQDFYbR2faGiIRiXbu.EI4GIi_vzTgMyjsmC6R.uz
 0.7x8chGVSfFD37l8IIO1FI.zBaRPrRD3JpM-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 07da5095-3fc7-45bd-b873-9cdcf08538c9
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-106 with HTTP; Thu, 19 Nov 2026 20:38:25 +0000
Received: from dip71.lsn.ir2.yahoo.com ([87.248.99.80])
          by hello (SMTP) with SMTP ID addd1d6f2e071d3be06230aa2a74c031;
          Thu, 19 Nov 2026 20:38:22 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
To: Vinod Koul <vkoul@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Tomasz Unger <tomasz.unger@yahoo.pl>,
	Frank Li <Frank.Li@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	dmaengine@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 0/2] dmaengine: bcm2835-dma: Fix OF DMA controller lifetime
Date: Thu, 19 Nov 2026 21:38:19 +0100
Message-ID: <20261119-bcm2835-dma-of-dma-free-v2-0-ebde4846d206@yahoo.pl>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261115-bcm2835-dma-of-dma-free-ef85776c0914
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795120634; l=1733; i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id; bh=TBSamSeez8zQQ9fCugauBqXaGRUEYL1qWXPb93Tu3sE=; b=gbbk1HzLPzHWC9sHX05ahBgSbM3yozVxZHuMRSczgyXyM/hm9IX9Zi9wq7Wg8GZmVSgMKFebr tLBgaKdAyvKDXpdoXu+wHyWGIyKCVi/c11IzqdG1TC2FFQyg2p5ATrY
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519; pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
Content-Transfer-Encoding: 8bit
References: <20261119-bcm2835-dma-of-dma-free-v2-0-ebde4846d206.ref@yahoo.pl>

Patch 1 is the minimal fix from v1: free the OF DMA controller in
remove and on the probe error path. It is unchanged and meant for
stable.

Patch 2 converts the driver to devres as suggested by Frank Li in the
v1 review. The OF controller is now registered last, after the DMA
device, and freed first, which also closes the window in probe where
a channel could be requested from a device that was not registered
yet. It uses devm_of_dma_controller_register(), so it is not meant
for stable.

Verified on a Raspberry Pi 4 Model B: unbinding vc4 and the DMA
controller and binding vc4 again oopses without the series. With
patch 1 alone and with the whole series, binding vc4 is deferred while
the controller is unbound, and HDMI audio gets its DMA channels back
once it is bound again. The remove path and a forced probe failure
were also run under KASAN in QEMU raspi4b, again with patch 1 alone
and with the whole series: slab-use-after-free in find_candidate()
without the series, no report with it.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v2:
- Add patch 2: devres conversion (Frank Li)
- Patch 1 unchanged
- Link to v1: https://patch.msgid.link/20261115-bcm2835-dma-of-dma-free-v1-1-d539234bfec5@yahoo.pl

---
Tomasz Unger (2):
      dmaengine: bcm2835-dma: Add missing of_dma_controller_free()
      dmaengine: bcm2835-dma: Convert to managed resources

 drivers/dma/bcm2835-dma.c | 53 ++++++++++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 26 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261115-bcm2835-dma-of-dma-free-ef85776c0914

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

