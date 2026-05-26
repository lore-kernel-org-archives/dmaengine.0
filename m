Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD62D3CFF77;
	Tue, 26 May 2026 08:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785323; cv=none; b=Vw80Hy2iA0qGCy2apX39I7sihMTjeQUZk0Fl18Dlds/KgYMGcMYswU3OMXpu8dc/BO2Aeku0PGcBTu5ZGuDOtevP1OXgRe14igMfVX+56KyBrPEqzMkWIsPAzwg6xU34iR/tyGQ2NNliu8sty6b2mQG5PFxF5W6EpCH7bV97FjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785323; c=relaxed/simple;
	bh=CeZEu3pwBJjDFmuL0EL+T+CD1lovZV0s4zpb/Tqh9bQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5fcgoxZ7dIgVZJSpQRXzOuBr8r88exj/2lxkDL/Gr88q8culAaS3td8AsbHl3Vp4RSVYahL/kICuxJioPzC1wkavWwNuVfciwogU6DFlTTxGHOaW3Yc5pJ/8pP9PPi1aeEuC50eX3kRzUCtbg53VufY6ZkO1ppDx05iuZsgcTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e00TlGJi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e00TlGJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2088A1F00A3A;
	Tue, 26 May 2026 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779785321;
	bh=TQbRwZQ7d4FlsIbqnLU4W3y/SMw7SJU8/ZByZ98sVx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e00TlGJi/Rraef95y8MEeGjsJI4PVUX9b8lQgtfz8pIIH3U6s3SMoYm5krw8yorpn
	 Tqj3lk8Zm5nnKHFKo2lUkzA1GmeYUAE5q1VyAAP576CcUJbGO3JY8KhmJ6fQoKCvvj
	 nxPSSTIXRAM41qBszuUc2gjj2mU4d1Y+VBh7gPYxPrZExGltrQhqXWoCX6fjQhB08o
	 DZinvz+kBXsv4l21khOn97+tmw5VE0g5DXaxAfjxUD6hM21o3eIqdPdliX+Uet2wYv
	 J3a4OFfeyBLnNEQh0aDIbZx+ajWX9BK/31JpAN9oJZGNHHrlTOyrROseXmUkWWDy/b
	 RhwDJrGhmWKhw==
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
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v6 16/18] ASoC: renesas: rz-ssi: Add pause support
Date: Tue, 26 May 2026 11:47:08 +0300
Message-ID: <20260526084710.3491480-17-claudiu.beznea@kernel.org>
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

Add pause support as a preparatory step to switch to PCM dmaengine APIs.

Acked-by: Mark Brown <broonie@kernel.org>
Tested-by: John Madieu <john.madieu.xa@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- collected tags

Changes in v5:
- none

Changes in v4:
- collected tags

Changes in v3:
- none, this patch is new

 sound/soc/renesas/rz-ssi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 71e434cfe07b..d4e1dded3a9c 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -847,6 +847,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		ret = rz_ssi_trigger_resume(ssi, strm);
 		if (ret)
 			return ret;
@@ -888,6 +889,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		break;
 
 	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		rz_ssi_stop(ssi, strm);
 		break;
 
@@ -1054,7 +1056,8 @@ static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
 	.info			= SNDRV_PCM_INFO_INTERLEAVED	|
 				  SNDRV_PCM_INFO_MMAP		|
 				  SNDRV_PCM_INFO_MMAP_VALID	|
-				  SNDRV_PCM_INFO_RESUME,
+				  SNDRV_PCM_INFO_RESUME		|
+				  SNDRV_PCM_INFO_PAUSE,
 	.buffer_bytes_max	= PREALLOC_BUFFER,
 	.period_bytes_min	= 32,
 	.period_bytes_max	= 8192,
-- 
2.43.0

