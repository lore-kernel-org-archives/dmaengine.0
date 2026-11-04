Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807211;
	b=TzGWpNyNtt+FqcemOGV0/10L/c5gK5moW/tke7KBiVkhtGo9ZrxHEdbxuoL8KmmvVCdx
	 y6iFIlX0dnjn0bvD8BeD6qJGl5H3HdOlvn/qloQ2yKvIVfCZvrGYYz8yMEeUVYyC4Gpsj
	 zf0Tqm7zZq/xmHZPvLTiTNt5H2xhXnCexloAeWztAAx0sHpEDNBXLkCM/m6UGg+dYLiVB
	 kMwh4UQEs0JepPHZCei4cIG25y9C8/4aUGzNfBjVygkQR31KDcsor9kOxD1hdNayZtQG3
	 UVBEe04/n+hYORKw+c1GvmMdgo79cJB+uq+sq+dei+cKL+GCQWcP1yGxqROW2YA4VrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YHNdm8WS8O7cmpiTCluq8jnb6nNTp793I0+H3Iv8acs=;
	b=O1apiJlwmRjX5a+U3UVLwu3gVV1c6HXQsrNbeAD50Znqi/RTGK8NifHjosX6jCJmYoIy
	 bJhGIsS1w9tk5AQyBBBPoRfo9vQHYjpHGPZJ1eLri/HDsvZJN5D3LmryrXROR5eFCRiux
	 ktW28JAh1M+R2R+BmXtVdRlDLCK5s2zT4ujm+FmiDIMG8s9go/mTEX4gDlLHE7Peb3sUb
	 B6DBT01ZtuDZ2ck6ffTkbq/XoUftohR7ahHgZua49i3CJ8I3Dj+3nNgu1T9sZ8v4a4/qe
	 PRthrjsEdr/y0/CoYKu90SfDbIND3z3JwuiSjJV1o5kcqeWaRT+q1ZrixXpZzFm/2Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tGvf6uV/";
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65532606A32D
	for <dmaengine@vger.kernel.org>; Wed,  4 Nov 2026 15:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65532606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tGvf6uV/
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a05b210703so508501b3a.0
        for <dmaengine@vger.kernel.org>; Wed, 04 Nov 2026 07:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807211; x=1794412011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YHNdm8WS8O7cmpiTCluq8jnb6nNTp793I0+H3Iv8acs=;
        b=tGvf6uV/qxwp6Qciuo75f19diU6x6TeIOd8sDHpgMZ/QR5kQFTvqilxAI8klZ2TX70
         MTL/M8UVWrcjlUbKll5ZwkuXw2xkViintysaV2m41QysCW9yY9sFq0Rm/5WBtSoxnCMB
         xLpOfQA54YYmsK6x5XGGayCU70zlrS/c42YjVBd/CVnYH9DyKH880dGZEIOqxwB0C7X0
         725m1Nv9Zhf4TyEeTgWVKlsk6CV3wS6mPCWpDUHJpDxO2dTzFVNNvpOCcxrLluA/4Rvb
         ULFo1qSuwKYJlsW/y2YAHYdOaQ1sbc0GwbjTygPB6YoUIq+gmiH59nlICupl083gtem2
         Oeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807211; x=1794412011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHNdm8WS8O7cmpiTCluq8jnb6nNTp793I0+H3Iv8acs=;
        b=MKqbrCZVMjEotRaPiRWpZMoOPGAxc7kzmwapDzMBfh2RgTou6B/8TKCPRaqotxFFzH
         5KzisNDANlKK5gui/QglqKXz7ZWXYNOA+Nfhl1ZuF7V+Oe2LkObpn7T2uMo4AvSif1Cj
         y7jDZm7E4PrcG0IermUMl3zHOj5kAYybRwlLd43+D0RlpC/VBPvIk1Y96cG2xx/XuGWG
         xJ/4i0/G9vw8SpdFBmwZPcft2kWQQObHcX6Xp6iFdBjL1QI/wdhXhCySRwlXXVK6UGOy
         q0WjdgGrAaDVLVILFfWRP6ANjC2a87nzaVurIGTbTUw4ABkokJmI/54sovTestovMjAJ
         6J3A==
X-Gm-Message-State: APuU4Z9GHn0h92u1kqfSm5N4dCe/wVNeulxJSaoKaM1sjJUkt1uhscCV
	9CIXYjhmRmsK43JSMZjdO7pG8NSNZpwpY70Ef8uvyzXlsYcUp2MXs2aZMl6aNw==
X-Gm-Gg: AYBFou2q4VU5Yg+51ZRI5ewzpiKXU53e5qFJvZuCWewhw8q7iu3XRN5bOG0shiiD+km
	QWilQUi+KKE9QLT9h/ZDzV2RGM2t3QRvGMudQQTYbE7uIRgR9OuEGYn3rzzhoGTpd+WHD8GatGO
	yspwBDDjoWsHE/R6jVM1XcB85YJxTUvrggAtA2ssIZqQDfyHoeQTbDLGN80PMg78i59lyxblJCk
	LIkfFiPyV00HRoyf5w+5ywYyNFRJw66mbaovYhz5+uJ62a2RZ64KNp1cOxFKvikb88/ShcAAa+q
	OkNLZ6c91uQ4pBx72/kc7qFSA1qUWpAV/nb/IP2XCvbfplnym2sH+j3oqZtnrHgRVEHQ4uaKZl7
	yZVtjdtH5edDNvTDjxkSdZ4f78FFCi31vooXbzrhhuv7Q0yK7wZp6SbfdmTFSaHf5+HCle4SDzY
	srzLdNZs2ojoV4L9jszwlWSdmhE9tH+tKY+Rlyh+whhe5eq1c/l0JzWJPIQWk3i4Znl6UcgZvPm
	PcR7rThV60Vo1LivR9wUNOl+cUYW8mk8XvX4c1Rr0z5xqx2YjR9rkBPBzHWA93p+/4RQz2D15TZ
	EQTXLzguDtX8PBuNKxf5QjSNfAN5l6RKNYHfRlwKVV7CdkC+GU39
X-Received: by 2002:a05:6a20:a11f:b0:3e2:819f:8a6d with SMTP id adf61e73a8af0-3e928d469f1mr15255320637.18.1793807210370;
        Wed, 04 Nov 2026 07:46:50 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb4694a0e0sm1372632a12.20.2026.11.04.07.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:46:48 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: dmaengine@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] dmaengine: pl08x: Support the Hi3798MV100 PL080 variant
Date: Wed,  4 Nov 2026 23:45:37 +0800
Message-ID: <20261104154542.3131916-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hi3798MV100 (HiSilicon HiSTB) carries a PL080-class DMAC. The block
reports 0x0a141080 -- the ID reserved for Samsung's PL080S -- while its
register map is plain PL080 and the instance has 4 channels instead of
the 8 the plain PL080 entry claims.

Set the DT node to arm,primecell-periphid = <0x00041080> and
dma-channels = <4>, and apply the two patches to add that support.

Tested on Hi3798MV100 hardware.

David Yang (2):
  dmaengine: pl08x: Release the reset before reading registers
  dmaengine: pl08x: Use the channel count from the device tree

 drivers/dma/amba-pl08x.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

-- 
2.53.0

