Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030402B9A4
	for <dmaengine@vger.kernel.org>; Fri,  3 Jul 2026 00:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783037542; cv=none; b=Brghiola6UszZZl5lK8PlTxu8hXfLJ9tEEU4bhtjRBuZU9ZiRJcjoUF5Z3aK/ZM4MkHuUtgc7xOxPQzU3PfD1R4ltBKXw4x4KMg8L6wiiUbXyZRYyfn3Iwl49PnsgZDuq6rzxVN62nR7GuU5YM66Z5SnxWXMUa2gvqC4g0fQ5S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783037542; c=relaxed/simple;
	bh=DBT8QbiXPV791Ei75jZRE+bdrb5rv+oRxEtX04MEBMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eyPy5822Zq5hJCcpH3VONtdcMSFHfYKnpK1OHft502dF309cBKv6YHwr+v2zwMy6MBCCURQTiJwT9axkyTkH9Ke5aB6OQa9tA1bEypQCpTYNLwqccuNuR8KnfqQdcEYY7Hgwx+rsJwD2a1tLxVTDf10LvtVgObbbROZzPoMHIoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUGaKjW/; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUGaKjW/"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c2cce930cso310931cf.0
        for <dmaengine@vger.kernel.org>; Thu, 02 Jul 2026 17:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783037540; x=1783642340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBT8QbiXPV791Ei75jZRE+bdrb5rv+oRxEtX04MEBMM=;
        b=eUGaKjW/PlpMqqXbBu7yiI6FKgvcpKROzSnkbNU5x203TTb/GBazkrWcIuMTjfBN45
         7YD31crDKq7AM3LfmjENZG/VCD+Lt991KYg1y1ITjZQLLILBuvYWFDgSOgajbFBrYQM+
         3TQRsGGU+0YuTTGRAYpxN6Mfm8s4SUyeXXVQxmuIgLRDPav8CLxD6tyiQrPWOPvNfYAp
         eEgAzjpRstnkxyhrRzWGiT/lRvj7EKDbYBq533uXnhCyssiSDn3z20SIyI3of1SBAUzX
         nv8gdgK/TkJnkPYGZXLv0STia0HuHleiMk4qlpfPD0X7OEFrO8xw0G5rqNJmhkdIrZeE
         JcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783037540; x=1783642340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DBT8QbiXPV791Ei75jZRE+bdrb5rv+oRxEtX04MEBMM=;
        b=rCMIoiic0NcnCvIoXDxz8y5myBUbrDx882lHr7USQJ8pssbMQUoFbMg5v91HWuMw9c
         /pNeXeQi8Xnuim6L1eIqdKEKcYlKRsmeaQD2NTeCL8C1ZU5dfExIM+HbllDf7KORzOfW
         AwRXbzRA3wkKLG7ZrsK6N2zcRbjH1+L3cA7vu5w9/TkZW8AoMwgz98+9/mpujX/nke8e
         mx5DxAE4VAneYSgjymAkXIbCP6J9fNrdxS7DRiXdmXlRoWMf8/iPC/LpltHM4k3v88IY
         zj+cMOBa5iykqZxVPq0XjaNes+Z/9p9hjS62WYhlY3RxyfQNWj0N+HGXlkoqqycUPXVt
         TP2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/t5aUFCgf2VwLfx+XCx4S8KUrfdCTZeywbvtysFk7OmMxzn1KpbcfHqlKFDOG8KQp6O5QTw1SieDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhY7PcIS84duFBqKyQTXzZ4Sq38mjIeprjfqfg64J+YkHWPpcD
	BuTu3gYi8NJ+dK6WHBzw8sEbhPY1S0GH5/Md9nUL93LnNhEeOTFA+vfi
X-Gm-Gg: AfdE7ckg+Z5nNXevqfyJtSy7sHwzq8W1puQY5aFS4WXtqbMMrhMdKh+T9wEpr5ZRDrA
	7wqTV1a+N1CiN4hqXTnvis71VB888RRiys/UjjCPwUS8cSYzkJi1w19Z9LwHLhT7Xy+kQl82koo
	3xzqC5RC83rpU4nTFB7zAH5tuGAoKy2JduI9OHAOm5lYVqMNb3dL2NxiMKhDp2eR0f3o+Y4U2Y3
	zXK/ahGU4cu1MVEeNh6DbRUcBJ7FM7KR5nh48BQVsnGCJoPoCu8gbliWAxnVQ68RPjbQIsqzVGf
	Y7/+IiKRnPjh86g+P6eF8Wf79eqg383wbHOrIjX83CgKwsaMPnvgn3CbNOTX8ysybl4thx0tB+B
	RZHhBNTgjF0Y8+13HJKwxPEFnnDP2I4Dwb0H90GmdWiCP+kaqeZV6uMucJGmRELFgpvjypsnBZh
	O+r28CLQuKzuO89Hikb5LM6UfwITVNg2qomv5NjqR991gKZ0MjUmHK6I1AAOkELHyv4eR1csM=
X-Received: by 2002:ac8:7f43:0:b0:51a:88f8:bef2 with SMTP id d75a77b69052e-51c2ad4803amr90244191cf.28.1783037540068;
        Thu, 02 Jul 2026 17:12:20 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f471de87e3sm40289776d6.35.2026.07.02.17.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 17:12:19 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <frank.li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 0/5] dmaengine: sun6i-dma: Add support for Allwinner A733 DMA controller
Date: Thu,  2 Jul 2026 20:12:18 -0400
Message-ID: <20260703001218.1243244-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Yuanshen,

Following up on my earlier note on patch 1: I have Cubie A7S hardware
on hand and boot test kernels over serial routinely. If runtime
confirmation of the DMA controller would help the next revision, say
what you would like exercised and I will run it.

(AI-assisted, as before.)

Thanks,
Enzo
