Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206240;
	b=SIkKikJON1/Qzl3q0KqQsmoztTUazmvPUevtcTK8gD4sJOlanF5TMsCl5KMgt1haeU9Q
	 WB5z/xSKXUEuVCBznQJkIoHKRSRX/Nw49HJ2u1jfZ/SKvX/IXdXIV7k6cZVcKpr/Aj3V8
	 BqHc9ahH9pNC8bBRMIC7Qplznc9bO0JNK5x/X13AjGLPNqFkJOWZ5tTcJ2D+LVfv74QCK
	 N88UhcC21Fc6LyhVqzN8QkXkMGLtE1bgtLt3dvZdBI2P0oSzBXKYCsx0GqEqDNZJkJ9O5
	 qN7zReKNDfVsVK/YCWgYRNfxvLClxlcGAhxjDrbjirOMDAHJxZ4Qyny15ZK4p4ehx9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
	b=LcPOMZeC+HL/NI/LRsqW6WZzxKhzllmIRLTm1LVOI+wErnciKvz20m3bGmc/rbjTTJSp
	 HWlat7uzoxOQwKluY1gIRi22qE27BCWaK7qHbvypYOfkMB94SX2YIHkdaPXPHft/ssvvE
	 558rJ4ESilo3E6SwHC0Ht6XJvZYMJhAYXe37/s7t2fF/ski6fyjNgN5ud3z86gat/DIAO
	 z6r19/uhdy/52mC0ag7ejub1oVRCZfytDjzYK1k7L/HQde4MMDBl0xzBWv2uQ8p0DzL0K
	 5fcbIHDGb9ERgT2xYILbepkDcSkyHr9BmwZMj81MbbPvBv4E4Es2Vn5L2IgMd9dMknA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvVViE7s;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39042606A326
	for <dmaengine@vger.kernel.org>; Wed, 28 Oct 2026 16:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39042606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvVViE7s
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso12730685e9.3
        for <dmaengine@vger.kernel.org>; Wed, 28 Oct 2026 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206239; x=1793811039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=bvVViE7sfBqKWfi/kLDJYlnvzOUXPLQxwi7WE8YcmF6ZlMSeeXt5LVtwTgYjpBwkt8
         SYP3vMcQXr/owFcgMM1gE2QwZ/DTceP96Ogemeuc3wSVYptLjbh5WQ0zOa/QFUl5Bsyv
         t91KeRJRSejTTfSC30ERKT+SYsNtmNlFP19tG7VGrb/Fyrtxkv8HCWTMM4co1xxufiUC
         fsayYomNX2KXae5ip40Tnzxu0+b09pZZ8pnmB2UJbRFHhmlzRF7my1fWETNYJaMtDwI5
         xLbeFqSzSFzkr23lLp9iNBgX8plx3P3KNsPgixIQp18S34Dqr3UjM2Pb0SImAbIC4Wby
         52og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206239; x=1793811039;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=uqhYgpl/v9SO4BnxLpjiQHrVuMqOMTiowA+NGy15oLn4PLWMN+F4zlgnxrkQE4IpOC
         vF/uUo1MJ3mxgIIVjJlvMrYU9WL4lEj+hFgcsQJhQw3UDm0k+omV0da1mZNRBfjF983P
         HmUbyZg7Iw/vX8ReYzcMbVuCNlWPyQj5HSV2VhvcHRJ05Op/XCDvbVih6yOZhOD4p8d6
         x4SoH/gb6F9zAzF7Vh3F9IAC4XbyPhnvogAu3IbjFqPRloJ0EYgsTCdTtcZt1SLRTUo3
         oNYl4Y7XVO+bBXWRpvjTXmD2Nz3TRQMGJrqTXkrNYRV8scbFNrZxv5uTIPdkWGF4S/A1
         w8SQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7sFjGEmGtpWnLqq65p4qQciQy4k75knT9qcDfHXqfafBI6+duAIgJqZT7AtZL3KcJITUEFBFYr6k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIE3ox9nlBooXu2CPMpVwi18QJhI/h7Q4BXDp5qDVILytqBfvf0
	wVZXCoVku0hoVNdB/cxWVWafey2qqW0X74H6wuIgGj00g1T1zn3Bxakw
X-Gm-Gg: AYBFou01fpm57+ag93xi50Zd2h7mGjGBFsr1UcBR2uOwe4P2+UmSa4ZiWWgMwKd6vfj
	MaDF9rSp1MDtkJndpErKPizhZPX703Q71dPcDLRWQfDqQar08vGLfJCwkA4Tu7TVuh4wYNw9M1p
	Df10xncYrfH8bRNKbtoseMAXN9r549GG1Ot7ixwc8pQjzr5BpzOJlIWo49GkGkHvXoQu/WXSG6z
	5QZIF6gy8SLemW8Zati6xWz6wyuqrMqTUBlNQsGSMBRhHODnZpxe8laFauGJiI0f+LI9VqkZqZl
	9haYnraQv/f1PUWO3mI7pgkDxE04y/rCr7qkpSwQ5LR2EamVHjGNTtT6ZdhrVfMx1Ov0OWZD65+
	UawgR5YvlLggjqriSVXRNz47uHsB6N/H8fHN2UIETT/CFwtbrJanA5Nr5pS69KUXThoqW5OevwV
	5KKLW9XBP4R5v1WyLkQ6j7v0DBwbL/JDJMxkzVD40KpXlqhn5bbSNTs66Fz4u/euLP5FdGwCrh0
	xRWWRu2+if+8S+RAhBpQlC+fyI+KEBZHFkoZswNTcheKlGDj38KmmkzEnGaMBv9DZ/CmbdsyuEe
	Pxhjg2OhxQWOBqSvfoL1PIwQzKwRa9qbHVGl9GVkISGXDZt7IIdoEMef7GljV/sAX+x1TkqUbQ4
	ZAK/gL+sauNoejZoY
X-Received: by 2002:a05:600c:630e:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4a9678bff9cmr62960175e9.29.1793206238343;
        Wed, 28 Oct 2026 09:50:38 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc4d76sm29895785f8f.12.2026.10.28.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:50:37 -0700 (PDT)
Message-ID: <6ae227dd.6c7231db.220083.ae75@mx.google.com>
X-Google-Original-Message-ID: <auIn2SfzeFL2CJn-@Ansuel-XPS.>
Date: Wed, 28 Oct 2026 17:50:33 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Anholt <eric@anholt.net>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Peng Fan <peng.fan@nxp.com>,
	Aakarsh Jain <aakarsh.jain@samsung.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Fix property name typos in if/then schemas
References: <20261028120216.2657397-1-robh@kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028120216.2657397-1-robh@kernel.org>

On Wed, Oct 28, 2026 at 07:02:12AM -0500, Rob Herring (Arm) wrote:
> Property names within if/then schemas currently go unchecked whether
> they have a type defined or match what's in the top-level schema. Adding
> a check finds a number of instances of typos. The typos result in the
> schema having no effect on constraints.
> 
> With this, fix the mediatek,vcodec-encoder 'clocks' count constraint
> exposed by the name correction.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For KPSS:

Reviewed-by: Christian Marangi <ansuelsmth@gmail.com>

-- 
	Ansuel
