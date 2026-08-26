Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC9349362C
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 01:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787707826; cv=none; b=i8TiXJl1wy4osNvACjgckgJqUdCQLueeyfcFjyjbM/XvW5FRyxcdtJ/aN7b34yfV+b7nYC1+rso6aOeqnUfSUt0v2aAfQKuXhW4/SU3iY2D4XZ40g/kTqGEF0XuzysCsyx4/MF2IjHHTWeK/abonFpmon3/39afvhIgoN0TkGN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787707826; c=relaxed/simple;
	bh=beIIm8qKX5xAz1kaK23VPevYeR5bzySrtqmTuOgVCWk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F0DLjtu5NkbqWo10d7YxEIydCcJNOuAYMP2sF6oYG0BxigF/NrqvIZq/ZDNO6rO8Bdb8AmlS7KxRKDuCSsAqEfU83aEaJ2g9h1m8fv+kXg/XlL2ovPtleAJiNd7+mOkc+uGkZqc4ueadtMtI5lTAsle/D97dzW6AD0GbNquZF8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9UfgDdN; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9UfgDdN"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e65e18969so35715785a.1
        for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 18:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707823; x=1788312623; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OZ92bi0xtWb9sBQgu6ZDoMhAhxRk9cQM2bCHLJFTXQ4=;
        b=j9UfgDdNXYwnq0quq6gL6uWpsN6sS1GqRR84UGJvjndL+gPbYtq1saHyStTygiwv0e
         vpNHJXCTHS7IXTnw1Y9lFTieKvTB0CrOtLLQjmU2Sq2zVKP5GyGI+0yqwJFg/z7GrxPK
         CX4B4fx7YGrqrYjFLViDKeXK5BJr9cSiNYGtIa3zsHPBd6kMF2e//nK94unRXAN3Xdty
         4Ztk6Kd19xXDkBcqtF6ayGXfT8yNzBNRIu1PTkqs2sAbGAC+E3HUcRsoXkRX7kTRtN+0
         91GbYJ08gq6/414S8gj2moiX7+NI9r+MV1NOQR+SAvGYAbB+Vxgzz2+wq0S3I+NY37Oi
         6WOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707823; x=1788312623;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OZ92bi0xtWb9sBQgu6ZDoMhAhxRk9cQM2bCHLJFTXQ4=;
        b=kHGv70o99O/rxYBrS+Am5rC3PPVolRt4tfnQDnr3LwddBOGtN7eBAW9HNenNhhlTYZ
         /LlOuXz29J8/aDEmuslYu/4RQTeax0aLns9JiPkfUVrTz79KlSeFXGPt6C/4PCLfgs7W
         OGXCzaaAxHgnSltYFWbx62TVtHWge59Xv3Rp3Th3bZS5og2L8cEhXtkgutVWl8zaTc3C
         6zAsNhCoSTJkvWooIPvOVQaGypvsmUA8ZKL1LzmDiQYVYUJSnalkTpRbFCx6o7SIwk/q
         0+I8Ig4IoqtBDm3GIeSuc8/JUA9xJKmw5MApMZOcS+x1zDa3/Y0AZjmCDHbTt8pILNss
         WQmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFkZusmZ9tzhRC2yPlOf+VXXXtNjVaYRLF2+i+bxIh+yjR2/sez0soEGJXjQrbe3PSRH5R3t7kztc=@vger.kernel.org
X-Gm-Message-State: AFuF++m4Zxusv0v/M3bZ5Z9fI0Hk2Hty3TdYTrPurHopKgCKjmfcUV+m
	S7c+a2Y0njty6f7OlLKFK5K76mlZ5xS+jHArTi746EN3YWGERuc0+4I1
X-Gm-Gg: AR+sD12bZOZpHMhMrznIdmfGczoc+1aTz4qC2kwXH/716iLAW7NSQmTmAmzXMlwuUVV
	mo7zQpGeoSxn8HKWuc97vKMv7Z8vDZ3qjpgfxQCemPJvU3LqOLwbYqRM34lxJRm5pAc8YuBFfK/
	BVuDsbqWOn2Hwc1uZbVisGCX2a9wPchG5PF5SrlfWEFmNgntpt/CIUBxXDY21vNV8UmPTrHOJL5
	svtDvRtvoua/l0qIRBxtyl/Y9w6zBT9pscqSSzvgpv58qGkqrsd3svfAz9bhomejkLTx1EeNQQJ
	YoPxUc/OmjsPgdxU9yvBfHSU0J4fB73qWE0H3X+qum0c+v/Pd/6Ps5/DRk32iuYT/PeQmMtGCH3
	TuaN22AP4L8NtIaa9SK88vLZTavywtOJQWOlOypwxaHmZ8hiUnQH6WsrdThqnOyccQcXj6EeN2g
	C2cdGy9U3uB3c8JXv6yhwPZ0OgivFOt4oOWESQdHGphjygTTHY05CU6X+6wt97UQ==
X-Received: by 2002:a05:620a:cc3:b0:936:ce17:7792 with SMTP id af79cd13be357-9376f3635ecmr870773685a.8.1787707822640;
        Tue, 25 Aug 2026 18:30:22 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:22 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v4 0/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Date: Wed, 26 Aug 2026 01:30:02 +0000
Message-Id: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBCG4auYrq1ppz9YV97DuCilhRoBQ6HRE
 O5uwQ1KXH7JPO+MKNjO24BOuxF1Nvrg2yYNvt8hU+mmtNgXaSMgIImkCoehkcRjnTGGi1pjA1w
 IyhWVokBJPTrr/HMpXq6fHYb8Zk0/Z+aLyoe+7V7Ly0jnu//1SDHBhea55MqZDPS5rLW/H0xbo
 7keYeWBbj0kzzhxQMRRUWN+PVt72HqWvJMqsw6UNPmXn6bpDUbPGuNAAQAA
X-Change-ID: 20260619-sun60i-a733-dma-c2455149165d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0

Hi everyone,

This patch series introduces support for the Allwinner A733 DMA
controller in the `sun6i-dma` driver.

The A733 DMA controller differs from previous generations in several key
ways:
- Support for higher addresses (up to 32G).
- A different interrupt register layout and mapping.
- A different number of channels per interrupt register.

To support these differences without introducing complex conditional
logic throughout the driver, this series refactors the
`sun6i_dma_config` structure by adding hardware-specific parameters such
as interrupt register offsets, address masks, and channel counts per
register. This allows the driver to support the A733 and future hardware
revisions. This approach also achieves the same functionality as the DMA
drivers in Radxa BSP Package[1].

The series is organized as follows:
1. Refactor the configuration structure for interrupt and register operations.
2. Add support for variable address widths using masks.
3. Add support for variable channels per interrupt register.
4. Update the device tree bindings documentation.
5. Implement the A733-specific configuration and register mappings.

Tested on Radxa Cubie A7Z.

[1] https://github.com/radxa/allwinner-bsp/blob/cubie-aiot-v1.4.8/drivers/dma/sunxi-dma.c

Thanks!

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
Changes in v4:
- Refactor configuration structure to use irq stride and offsets instead
  of function pointers.
- Use GENMASK and field_prep in set_addr for different high addresses.
- Link to v3: https://patch.msgid.link/20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com

Changes in v3:
- Reword patches for clarity.
- Link to v2: https://patch.msgid.link/20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com

Changes in v2:
- Implement SUN6I_DMA_IRQ_A31_COMMON_OPS macro to avoid duplicate.
- Move set_addr into helper function and revert back sun6i_dma_set_addr.
- Rename chan_num to irq_req to avoid misleading name as suggested by
  sashiko.
- Reorder and reword the dtbinding patch for more clarity.
- Link to v1: https://patch.msgid.link/20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com

To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Yuanshen Cao (5):
      dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
      dmaengine: sun6i-dma: Support variable address widths using masks
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      dt-bindings: dmaengine: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compatible string
      dmaengine: sun6i-dma: Add support for Allwinner A733 DMA controller

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 drivers/dma/sun6i-dma.c                            | 153 ++++++++++++++++-----
 2 files changed, 122 insertions(+), 33 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260619-sun60i-a733-dma-c2455149165d

Best regards,
--  
Yuanshen Cao <alex.caoys@gmail.com>

