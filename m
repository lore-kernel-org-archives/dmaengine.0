Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EDC387348
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 18:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150222; cv=none; b=KuLpmX1IXixTKuML86RTLw5JPXXxjRnLUnnY8dWVNkOI0c8MJTjaafdy10MgO1TeJogKFJMq10uc5+lpIgG7KT/bEYHX1L/LBUAR7OXO/d5gvi/VjZcZd03wUOn2NgbaqoLqoFM3ukFV6S/SILp03iGwDxmNCc3ZqKUDdyrVOVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150222; c=relaxed/simple;
	bh=pFoLIhtHfUm14OpIGSbvqjL40AJBmN4Y3fFmZiUfOIM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Bz69CwX8w4UPxy6+Zx0HigIrDAR9QnFZn8oV0uuDjL5F8/sW8TPaFXUbMQdU7AkQKKdP99Q/Wsp3bAmqBQZSNQI26iLO90S7On4PIFEv1wgSf+YCvvJN2dnEZiEr6y1yBT/oNQfcbrH8JIVXVdmdc7jdIHUNPJ7bAhS5UDGK3L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9egalCr; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9egalCr"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso286358a12.1
        for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 11:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150214; x=1789755014; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3cxa3dW2rb8gMN+b8Efg94ssh5+KCVrUeOlRH+bN32g=;
        b=Z9egalCrHikkPZ/IcF01BEvdZ7/DMiTGNGDHvO1rHXBqHb8OLhjzBISaAYl0JeF+/Q
         kP4CjbE5uEyV4m/pVDLtkJqusJSxspRP6nSSqan5av3EpcV0WiIbVEnyWmwNohMW57nF
         1OD7CymakQ6aDYC3po2sxLxQVsrVTJhb7WnNrPKYXdGBm0xy1Ei4qLHiV2+XeqQybIgj
         yvT7Yv/T1LlKZRjnfc5XA806RAHFKvpyhl5+6FSRwkmlKDCW2H251YYYiXBvIHFZivBr
         yeWpZNeclqUw0SZ0JkO2vreDD41vzQbdEHPW52MhuKecI3RiXF5JU07BZ0s+lFvqWyd5
         yPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150214; x=1789755014;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cxa3dW2rb8gMN+b8Efg94ssh5+KCVrUeOlRH+bN32g=;
        b=XOA8/ZilrS9vBowxXrQxO67trc86ejtRC/aQR1Vb7orSmcQW4yS7oWt33dBlD3MAXG
         T517AOLyMmENBeZdLa/DPU5hfe8O96fgDQKG4eN8ajQl+mHAy58RS1j6DxeOFQmVW6g9
         +aTObehnViiRdBgaTTpn67mnakcO+/dJo0/SjHkI1B1I0xbN9vdUMNvw5QL4T22evamz
         V+lF1L3h1sVOfbncZOPfgu05nA1JT8Gi6C+Hm8OTwlQsDYa4IYg1td8EnX0Bzm2+A/Fy
         5TyaTUyege1u/fPix0m3/8Ynzu/z8/uKhdDCnk7uW7hq5SDSsvPlJo3HFl4sR/rR+QmK
         t8eA==
X-Gm-Message-State: AFuF++k40+dmf5YyNu7qDAkW+dNJYTAAcg5Q0Oq48bY3WC+R94oMsu0I
	U07E2Jk7XE6mwEw3xknZukbopkyUkk+N0yCh0hBRK2x0ya88i0CV+EMb
X-Gm-Gg: AYBFou3Eul6wJPYq4bl2tomXISO3zy4FKb0AXUdu4x8c8bUfzXqA436v2U9Mzv2iRmT
	+ilcIEEZWDNbglqsRT7cHpIdpKumILPn/StNDT9nmb2LvMeACWM34ixJF9+5BqysITiyO5fSpdQ
	QsVmqBSLh0wakmpm6ky9Zae9XJgOpoPr6BB5loZkj8hekGygUyyzwvYIpnfs12B/1O1oAmSegnl
	qrIm3ZYGhDyQbXhBAaBM4DEhFM0vbe+S44/HXYCNpOpnnrH6x6G9/o5Ej4g4XVyGB1Qyr/BJ6p6
	q4mMyZ6XTpUk8r3+pMvbFUPtAS45+jrQM3xX6rN9Xfk0+JrHz9hgZRh5+uM+SS5l7HQnf0W+LkO
	OL/oyQCshrQzvkhXlaZB4VKqD0g7hPgL9O8fXCqtv7bmE/+/awHQEWhKj3d4A8biae1qiwSagQK
	vbHkoflGKCzLjeVCQCBeC2dfS9ZlJHze+MZE9SbLnmaXR0ldjeVjYORwvqoa6DRdld6t2Tlreck
	Vq0ZnOsC08IGRx3ufk8CbKh0aeZ+pRrqltsjhM5mSR56uh7K7TBz8m6YHAB2CL2rjSreXN+A/CI
	yhTzqIjFwcNvgcu6TJOfApxRTDnV7p8T2s7lAxj9zpVfiTDe
X-Received: by 2002:a17:90b:278f:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39d9bbe47b2mr10254399a91.1.1789150214007;
        Fri, 11 Sep 2026 11:10:14 -0700 (PDT)
Received: from localhost ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95752809sm6212701a91.13.2026.09.11.11.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 11:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 11:10:12 -0700
Message-Id: <DLCOTGSJIKI9.2U1ISL32HW8C7@gmail.com>
Cc: <dmaengine@vger.kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Anatolij Gustschin" <agust@denx.de>, "Yuri
 Tikhonov" <yur@emcraft.com>, "Dan Williams" <djbw@kernel.org>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: ppc4xx: check dma_map_page() errors in probe
From: "Rosen Penev" <rosenp@gmail.com>
To: "Frank Li" <Frank.li@oss.nxp.com>, "Rosen Penev" <rosenp@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260910214334.86689-1-rosenp@gmail.com>
 <aqQmw0j8-s5DEv9v@SMW015318>
In-Reply-To: <aqQmw0j8-s5DEv9v@SMW015318>

On Fri Sep 11, 2026 at 9:05 AM PDT, Frank Li wrote:
> On Thu, Sep 10, 2026 at 02:43:34PM -0700, Rosen Penev wrote:
>> In ppc440spe_adma_probe() the helper pages are mapped with
>> dma_map_page() but the returned DMA address is never validated with
>> dma_mapping_error(). On 440SPe the mapping goes through the
>> SWIOTLB/direct map, which can fail under memory pressure or with an
>> IOMMU, returning DMA_MAPPING_ERROR. The bogus address would then be
>> programmed into the CDBs used by the async validation and
>> mult/sum_product operations, causing the engine to DMA to or from
>> arbitrary memory and corrupt data.
>>
>> Fail the probe when either mapping fails, freeing the pages and
>> unmapping the first page if the second mapping fails.
>>
>> Fixes: 12458ea06efd7 ("ppc440spe-adma: adds updated ppc440spe adma drive=
r")
>> Assisted-by: opencode:big-pickle
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>>  drivers/dma/ppc4xx/adma.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
>> index 279a431ccae3..89e778896d7a 100644
>> --- a/drivers/dma/ppc4xx/adma.c
>> +++ b/drivers/dma/ppc4xx/adma.c
>> @@ -4156,8 +4156,22 @@ static int ppc440spe_adma_probe(struct platform_d=
evice *ofdev)
>>  		}
>>  		chan->pdest =3D dma_map_page(&ofdev->dev, chan->pdest_page, 0,
>>  					   PAGE_SIZE, DMA_BIDIRECTIONAL);
>> +		if (dma_mapping_error(&ofdev->dev, chan->pdest)) {
>> +			__free_page(chan->pdest_page);
>> +			__free_page(chan->qdest_page);
>
> put these to lable out
Problem there is this is in an if statement. It's not as clean to handle
here directly.
>
> Frank
>
>> +			ret =3D -ENOMEM;
>> +			goto out;
>> +		}
>>  		chan->qdest =3D dma_map_page(&ofdev->dev, chan->qdest_page, 0,
>>  					   PAGE_SIZE, DMA_BIDIRECTIONAL);
>> +		if (dma_mapping_error(&ofdev->dev, chan->qdest)) {
>> +			dma_unmap_page(&ofdev->dev, chan->pdest,
>> +				       PAGE_SIZE, DMA_BIDIRECTIONAL);
>> +			__free_page(chan->pdest_page);
>> +			__free_page(chan->qdest_page);
>> +			ret =3D -ENOMEM;
>> +			goto out;
>> +		}
>>  	}
>>
>>  	ref =3D kmalloc_obj(*ref);
>> --
>> 2.55.0
>>

