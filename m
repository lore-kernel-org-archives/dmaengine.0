Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D994657C6
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 17:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786986976; cv=none; b=gYvDL18FfXl+w02QwudSiald33WBtfbwEAxIMt/BnVksEORa/NKMaAYw/yH/addTbBqDtIk+Y3SzrDtp39RK8E4nHn/c3aEsLQ/KQsbMZZMXcpDzlswkNaPinZHvEExQHGtkpfcwQpqAVDG8kzDdJVZtx5CdXb0Ud4bz+23axTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786986976; c=relaxed/simple;
	bh=dU/hih0hnP3rkicxnLGzGzbvz5NWJvf7JF/NG7uN72w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dX5kKpRFNaqfumduDOWSPQIoV4tz8L70lbxSRWa7tFxAifDIIHnMqAAu7N2ep/X+lqHPiQ5PndIBoX+/7mw+FdxdbKPeXKqBzEH4kLXXQG8ZaLyk/vKOpjdsoxvQm7NFekjRHzp+DwUTTtpHEO9I3clGzTGqFeLbHS8d5VvG/Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+YgIFNg; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+YgIFNg"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-472326ca506so2573053f8f.2
        for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 10:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786986973; x=1787591773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7vHVmK2OakVdQp/KOqM3ZoyU6wCsebXeGNivr98rrpc=;
        b=h+YgIFNgmLvUPawGDcpX/VQjV8o3Yt2E2k/+GEbAVjy1f6f+LgDPihx+bHXKs/71+/
         JOFKCGeqW6m+2BqIC9P/r7xS1YsFvY8g7sDQDBEVRev355OvMgFTSP3zLCmGMREcTz9M
         j9TlTTmDojGAdq1KDdexOZnGGM5LBYESzZrqynJI0NROj6Sj34sIpa5TXGvF5WLHdfTI
         DZLdFf1L2dKW4Z1YBjcaWUIcSI/j5ZMeH09kxmYle5QbyLWNX3jK8r70QtETJdNt7L+q
         g2x4BlX6MMf8u7mDRzOOWee8aLMf+NFN5YM1L1Q3kTiqJ4iwdXg/boZ3AaF+0iEkB8T0
         PWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786986973; x=1787591773;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vHVmK2OakVdQp/KOqM3ZoyU6wCsebXeGNivr98rrpc=;
        b=HyPJHoMh50dITtct2pLZM7t0lD8XT2XiYioZeYZQeAgOZ/iNVQllIrYhQzsDZsnyfb
         SYQKdC8XCm0MFOZ3qNz02sdBV4IeKYcaIxv1ex6L2JW/DrGqRvBRbIZP/OIbzal7vK2v
         inO6W+2QWIgJyUGJgEJsIq2/WEaqUwSHiDRGY9lX0oqV3H+eCpBiB+xeVn6hj3/TBcCA
         tdopNzwExU6naNc6b6cGjsNB5q7UF41pDTKxo+YKSs8XigXMImSuuaeZqq0YoCr42ion
         TYq9NaCo8S2lq9LmY+qtnin0f4LCVRxLHWOqkI0T5F1NFwN81hILa/vyAdym41q+lTdl
         KntA==
X-Forwarded-Encrypted: i=1; AHgh+RqDwXakDE04IOfuQZ2Ow31wgAu9hujLhpAQ1WU/gKoF5X8SVlwNW/ToATf/6otQNiWrlF3qEmCU+w0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjbgBvalpJU/koCTItfN+TmgL9txGWWLk+IUPuk0/w3zC1Qo0O
	XW8uFMk2wcNL31gSLQJXeQVEsA7mX+6URUhZCvOkUAHxMzoDiMSWHhrn
X-Gm-Gg: AR+sD10ZmoJrwwHbRSOcF8nlLEKVuv1bEt6/cUF9IZla0k3GpZjbA3Py0yRW2LOw2im
	XKAe6u7TQokNOFKVGrPIpS/wbut1/jKUgEtHrZQ2Q/G1dqdQmdqiBiYITLEekJD5B22NGxb3u4j
	0AQqg3tJcfMhZY3nNiTqUPl0e/51pDvpG/mpifoiUdSqPhFX8bDdhYlNmRbQknPv4T8tQcb8DgM
	rXtkppTIzl3L9Ci/g1TjAb6Et+SQ4AHk2pm44BoRuXAQ+mY2EgwuCdhkFTkU0qmFJYNvQnMc1OX
	lrP7D3LM8A0Qk6zUnK/eFWOybbF0qc0xvOkWg0bwwhwadBDJq1NaIKdO+F+Jq0rL6zqlXrQuhH1
	bxV3Wnozq6eNNeQJRAieBgHtZAiNnkHyYVNprf7ALuqRdWu+GsTTp15n3G0/UCis+OHiKk9RDlK
	yTp16JN9GJhyqiRrm/1GEJouLufIfQl8bOJrpxdosrPvcbzN0tGkwicz7ExaX0niEiiTE=
X-Received: by 2002:a05:6000:46d7:b0:47f:9aef:5515 with SMTP id ffacd0b85a97d-482a9002c0cmr2267004f8f.13.1786986973156;
        Mon, 17 Aug 2026 10:16:13 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783d1sm5445518f8f.25.2026.08.17.10.16.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 17 Aug 2026 10:16:12 -0700 (PDT)
Date: Mon, 17 Aug 2026 19:17:31 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: frank.li@nxp.com, corbet@lwn.net, dmaengine@vger.kernel.org,
 hch@infradead.org, imx@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 lizhijian@fujitsu.com, mst@redhat.com, rdunlap@infradead.org
Subject: Re: [PATCH v2 1/1] docs: dma: correct dma_set_mask() sample code
Message-ID: <20260817191731.104171a3.michal.pecio@gmail.com>
In-Reply-To: <aoMty9Dvt2bnWm74@SMW015318>
References: <20240401174159.642998-1-Frank.Li@nxp.com>
	<20260816071044.331a2c51.michal.pecio@gmail.com>
	<aoMty9Dvt2bnWm74@SMW015318>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Aug 2026 10:50:35 -0500, Frank Li wrote:
> On Sun, Aug 16, 2026 at 07:10:44AM +0200, Michal Pecio wrote:
> > No realistic chance of the dev->dma_mask check (below) giving -EIO?  
> 
> dma_mask is pointer, which already initilized by bus driver before
> call to probe.
> 
> For example
> 
> https://elixir.bootlin.com/linux/v7.1.8/source/drivers/base/platform.c#L634
> 
> If you find one, which bus driver have not init it, please high light
> it.
>
> > > dma_supported() will call dma_direct_supported or iommux's
> > > dma_supported call back function.  
> >
> > Aapparently, it may also use some 'dma_map_ops' and there is a bunch
> > of those spread over drivers/ and arch/. But I gather they are
> > expected to behave similarly as the functions named above?  
> 
> I grep it and checked at that time, all return 1 when >= 32. Now more
> powerfull check tools avaible, you can double check it.

Thank you. Sounds like it should work then, though I think that
checking return status won't harm, just to cover unusual cases like
regression in some obscure arch or people with buggy out of tree
patches (which they "forget" to mention they are using).

Regards,
Michal
