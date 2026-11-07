Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794089711;
	b=v/m9xfBSaUJm/mmjZOp5XaRkJoUcKgrDcN7ICiPtC7NAqEYCNtQwvV17iOsPP5QCJdSs
	 CbtGvjF8LZOvCo35euVSR7mDmQ4rcyAs/KUYb8scD+RLaEtNYRmQbE738+P6d6XW1TC5M
	 qCD1XJJzwdY4CK0mvqdWdxVC3vapnn9uv2RbNYShQcAgzxSUGyJqadExFHC9oZHu3kdjJ
	 3oWCYDqQM11GHWXJzlsz9yydjdKBcKWJVoVdi3wg9hnRqsXWk89XA7ryZlGpm4bBrTqFx
	 TUnwNFFk/n7/0km6XG5ZUgZUZrFkNGn3/cuGFGBZBMuVkAot8AcemffvbleuKu/y0EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rtChpQ65eeoLVdZ/dFUA18szw3uQepSIX2YdKa6qr4g=;
	b=UaofXAtYZVKSwLQHl1SW4bFLJuU0kztapIDeZPitOnZAD/r5A03z4NIdRgxa5ZeG5GJl
	 QNFUZ9bBa6c43Pbo+GlYsjeHp9PsaPltrND09pR0r5gTp1au2UHUiVyrr0ycwKNy5djRz
	 4xYaN6UqST2erFFDE6jXiWV0NeM7XQ5+/1zCH1/EC6ILvx+YGn2jTayTdfRyMnuFBWGuM
	 d9/d/ILZ+qDE3yCVaBjki2MpoXpmq5UV99ewD0nVV+2/NswCC8Ay39Ajk80RMzTeS2P1N
	 Ka82zb1dXO6fCI5erSD53gvoZYsw4BHxaxpAdgNaykbhPwEqRTu9nJDqx8eW7dPFzew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTpmOR66;
	arc=none smtp.remote-ip=74.125.229.2
Received: from mail-dy2-f2.google.com (mail-dy2-f2.google.com [74.125.229.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A76606A333
	for <dmaengine@vger.kernel.org>; Sat,  7 Nov 2026 22:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A76606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTpmOR66
Received: by mail-dy2-f2.google.com with SMTP id 5a478bee46e88-370ebdde89eso100975eec.1
        for <dmaengine@vger.kernel.org>; Sat, 07 Nov 2026 14:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794089710; x=1794694510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rtChpQ65eeoLVdZ/dFUA18szw3uQepSIX2YdKa6qr4g=;
        b=kTpmOR66dBAIZkOKjeV1xswlTFvCGfcB1D5HxfKVUivRzVFMkk/UcARm7blrsZiYwZ
         isqPtifc+JRwjb+eRX0uyk+d8xiaSsOfHL/MH1ezmplm0akBw+v6bDmQdO2DpfCGDH0m
         2IDYRwjzTSqsgXTWTs5Ix5qBq4g83lDPefss02DtmhWSPRzZxxTP2oztUTWWW9D83m4d
         5YXjrxqut0QXpRhkvz3YRAX9vmlqnkpKGdexKwYEvUJdkn67VaQWvHpjApQ884/2VK/J
         ioGgxSWAMjcVBpKkgWCCT8y5dyAjyNQeIdpoz0bmLnfMorwgk1wEwb1Up013iZzd+8PY
         2ZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794089710; x=1794694510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtChpQ65eeoLVdZ/dFUA18szw3uQepSIX2YdKa6qr4g=;
        b=Hi+UQmMGffhv1KctwxoQWtBIQ595VCivq+zQ9Yh3cKFrxJxa9x31HgKYGMsBAZJ6/V
         CQgqv7M1mbeE6xwuZ1pNwv69P1sS5utmkd8t/vnnw5G1E6SBUIS3DOYjgM8c0B0mhfmg
         6CnZY0k1HY921AAuEeCE6/n5RYvJuiQ3o2xzzZD5Ad7abOgIuu4bv85wDYpNy5gPq5xj
         T/chlcRSxwTXPxmWeBsSD5w/eE/Pw0zsJ7XGlNf+pcmLTuEbW1FKsGEXWudpmDkHoizr
         7viip2PS1azjwDuv+iSQLP+UFSKa48MhR+Ypttxcja+LE5opkoqH1Ufoz3zyRR49M5Ua
         vB4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzkwTzy5N9aS16hQ5LjhYH8iHP17N7rz+Nu3sX45DEG2QHJQDFu5GWa9C23Mq3vDCddRqUHjuxmGd4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/7LkrRLhqne5J5vOo1DxjJEVHU1UDVGmZyn+uDz7vXykdZltx
	r7zoeWd/T7jGRM+04cZcPkOB0jl5z/BX3xwic0ODAbLsJH6lVcU2dq0W
X-Gm-Gg: AYBFou0BPdS+9Ra3Dymm1cTJd6K/0ZzkzsG/BcZXAhOnOQOoMIVw3P6WTVo79lCROad
	wv+o591EccJ9FntkiXQ+gl2i6avLQY33Trqg6PU5Yv3yen18rsw8lVOdcsfSOH1x71vzyeUzQlc
	ZWN04ZBabEHHBiRMf8LhpUmYxewGPNyaxnpRXX+iQZMese4K87flkX0vTvqVynhT1Xk48T8Fkw0
	0a46SK6CQ6bLFHyJOkZPVr4E2Kp6DdWdBmjawU2zZHxgc8oCG7FXzwg8afwgCiIOevAvZ2R2Y92
	63+f0AL8DUC1SxkWIR8LtzIZx3QgaroWY7uNH9940ZrK2RWoaM8PQ0KccUQOBAPEKxtZql1TAbz
	Hyq6SMKeDr33ntSt/Tp3f4XKuUEPnKojORHq2hMjJKVqZ34VnpyqePzzA93V7db5ha4LVN/Xrze
	SvqJj+BK6fFNHxsoW5XawBU56TMVCl8N8sY4DtU/0i4mlI9mIXFxXwNSe6iDB3Z93ux5jgM1ddc
	Ks3sDJrhVpN/XHdE/kBs4UNKu8V8+vbvaFMIrSGP2F2tGUF1+mFvhVbb9KZf+Q6KBRZkpjvhFfH
	JJJJ5sim5Ii9/TEwLruI/hubWA4NBI7jQOUbXSV1PPQ1tgTE6c2sezZ6mi5gfqV41ParYe16Obt
	ZwjMjDm7sflKOYXazr0bB8nQ4Uj1PYPdfUQIOOQ==
X-Received: by 2002:a05:701b:4348:b0:163:bee9:b250 with SMTP id a92af1059eb24-1b25d321963mr8857586c88.22.1794089709615;
        Sat, 07 Nov 2026 14:15:09 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm1465914c88.4.2026.11.07.14.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 14:15:09 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: okaya@kernel.org,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	andy.shevchenko@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] dmaengine: qcom: hidma: avoid world-writable channel sysfs files
Date: Sat,  7 Nov 2026 22:15:00 +0000
Message-ID: <20261107221500.96825-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hidma_mgmt_init_sys() creates the per-channel priority and weight
attributes with S_IRUGO | S_IWUGO, so any local user can write them.
A write stores the new value and calls hidma_mgmt_setup(), which
programs it into the channel's QoS register.

Attributes declared with __ATTR() are checked at build time by
VERIFY_OCTAL_PERMISSIONS(), which rejects world-writable modes. These
two are created at runtime with a mode passed to
create_sysfs_entry_channel(), so the check does not reach them.

Make them writable by the owner only, the 0644 that __ATTR_RW() uses.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/dma/qcom/hidma_mgmt_sys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
index 9672ef9ee8fc..53b991752e80 100644
--- a/drivers/dma/qcom/hidma_mgmt_sys.c
+++ b/drivers/dma/qcom/hidma_mgmt_sys.c
@@ -265,13 +265,13 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 	/* populate parameters that are per channel */
 	for (i = 0; i < mdev->dma_channels; i++) {
 		rc = create_sysfs_entry_channel(mdev, "priority",
-						(S_IRUGO | S_IWUGO), i,
+						0644, i,
 						mdev->chroots[i]);
 		if (rc)
 			return rc;
 
 		rc = create_sysfs_entry_channel(mdev, "weight",
-						(S_IRUGO | S_IWUGO), i,
+						0644, i,
 						mdev->chroots[i]);
 		if (rc)
 			return rc;
-- 
2.43.0
