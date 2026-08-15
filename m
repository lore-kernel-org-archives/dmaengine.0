Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74E13D810F
	for <dmaengine@vger.kernel.org>; Sat, 15 Aug 2026 07:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786778680; cv=none; b=bB6dv5cQcKGwCThFOvh33x+c9oCKlMQ+Wcj8+K+ef5eZ4NVhT4T3joFFXfEFMWvlUg7hGpPx+4FEdOSimV3k6UDprNr7WJ79SLGfjx6SpHq4ghDAvt7aDnoYZ/lgXqLSlDxnJNRRVgUI21hdFydIexNZxQado7lN8lMFE5IXp1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786778680; c=relaxed/simple;
	bh=d81zRYCsqoH4yC+fFuwiOVWQ7sGjNnHCn37vF9eBXco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLMM3KHVpmrEW9HUG5VbrrA/EaL7d+zZwO7IDjbb37NyHItm38yOD08i9RIxJh1gmuf1vCtDvBCRF1mVS/Nqgyxepyac4bd7G+naaxTfMgebBQTOU8fXZs21Tl8OKw+oKiozZJLEPNyAmiof2r12zMx50onIoO6ZhceZKq2WEXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsL0tb23; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsL0tb23"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1587504a91.2
        for <dmaengine@vger.kernel.org>; Sat, 15 Aug 2026 00:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786778678; x=1787383478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d81zRYCsqoH4yC+fFuwiOVWQ7sGjNnHCn37vF9eBXco=;
        b=ZsL0tb23F9G19dj6CH+UHYuRyAMJfzv6fSvaUG3FKX40bNYtFwAuNli7kAJ+8rR5Mz
         qbFNzY/4bi8W9AJrYQf83MhYecA26UtDQIlnUpiB4nRiK/ND4KU/IrLmtrkBKNy2P0Lc
         6MxRi8oHQqXHnxtYwBJ5uP4/+e/6BEvxWESsH/dXcith0DACNBh4B3g755YAJGAx6bZ6
         Mithco37bRTEciZnbAVbofGbtVkbfMbGF3TyBTAxeneHvWtpnrjJLxUxRL1nn/k/JQi6
         8JdOS4mABVjkvtIwvaVAqtxlhFJ81U3I/HzVDmgDG3GSicTAUxy0peGngyZA3cJ/N+yQ
         71JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786778678; x=1787383478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d81zRYCsqoH4yC+fFuwiOVWQ7sGjNnHCn37vF9eBXco=;
        b=K5aayHqE1/zg29dyNxKMoR+wsUJfANC+HrahqvBSQsRgVCNnhlkfv4BKED4CeGrmxr
         LlHDslqW6yfoGTrUNZY0NWtQ27356hJBOxSRvtuekPOEg0kuERUr9qgIzQEPPNo1FZy8
         LCQjG4LOE2mCA2wcJSsYlTtlC5HvISATmmCq4PeCJWs1m/miUQXDoDZL/foZfGwuE4Dr
         IqntL7qf1P+XTRy7idudFaavHFSrQ6ogvJJNPwk/IoA/mLvyv7HcKxZuED1ns4uszBFU
         mtSubxD33FTr4RvuIG9U5RejoZgB7mXCu0zE2lTpHab8+6Y2Do1WQDz1x4uMFtpmj+sv
         AOvg==
X-Forwarded-Encrypted: i=1; AHgh+RpLGtLSv49uGktcVv0175+xy2iCBEjdNz6T0cCBKzs1UJ4p6GExpL9+q1LRNXrEDhnTh4ktmDcmcfk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqd2DLEEU3E8N9Oo5u2tCZyRmQtdsFosNz8Br6eV+aNnHh5JbW
	ZcuwdnZmk5rrPfzlal/TKHmJMl5r1adZH39Lu94x+7A213cQQXtKz8v8RLV6jfL6
X-Gm-Gg: AR+sD103w1ZB2u9fh0HkeZQ35sQalqJFRPOxTU15ABb3ZpjMyRU0N++vSFuQKXVOaPQ
	K9kpBOyQgmWqdv3xrqK/0Sss5MeZBZfxldJlCWHXYNuJddCDBTS/3ylPdShu62O76GlYKGV9UFn
	wQBE3uc6YQ+Cvyp8vg29IdYfHLtoLsTDriicOpI7BKIlU2mHcpiJxmWlqE5DppbmBHs5MrHcg2k
	hLFlAvR4fakZPz7JbIFSYW/ONw4ERv5XhbdBhfAMXp9avtA3cRyvzn+s9kFO5QfaPWs8fsAjvtN
	LspXByg/qf0VYTOMojgl+3hKfgEu01VNybn3Wm3XPHTpMGcUIVcIIYk8JIMJibokMOkvzYKvEk/
	QRx78/kAC+8xqTePrX+W96zEKJR0hoxdXqOlAjzbZRxNRf5ni8dxsD9RnqNsutt7oBA0izfcJ1J
	WCKpjpxOzF+gylCx9StXqZaa4q3lIfZu2xugrV7Fn0CRyWreyGncm1Z1NcQrILeCff9GUDuQat7
	W5s+Ci+nQaI
X-Received: by 2002:a17:90a:da8f:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3933b95e327mr12509086a91.14.1786778678185;
        Sat, 15 Aug 2026 00:24:38 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ed5b1sm27142118c88.8.2026.08.15.00.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 00:24:37 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: frank.li@oss.nxp.com
Cc: Frank.Li@kernel.org,
	vkoul@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i: fix use-after-free in descriptor error path
Date: Sat, 15 Aug 2026 07:24:17 +0000
Message-ID: <20260815072417.2636042-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <an-B5SdpGfsJoudH@lizhi-Precision-Tower-5810>
References: <an-B5SdpGfsJoudH@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Aug 14, 2026 at 05:00:21PM -0400, Frank Li wrote:
> Drop review-by, I prefer use below method to fix
>
> https://patchwork.kernel.org/project/linux-dmaengine/patch/20260727061142.44195-1-zenghongling@kylinos.cn/

Thanks Frank, agreed. Hongling Zeng's series is the better fix since it
reuses the existing sun6i_dma_free_desc() helper instead of open-coding
the save-next-pointer logic in each error path, and it removes the
duplicated cleanup loops entirely.

Please drop this patch in favour of that series; no v2 needed from my
side.

Thanks,
Chaithanya
