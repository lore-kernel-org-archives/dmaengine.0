Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18529486634;
	Thu,  3 Sep 2026 16:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452404; cv=none; b=jn/kgeKAv7aVLtXJ0+ha2/8XqSGiwhSmmUo7cLhSGXKiSHU1mbtgslygeTdqgg8wICmuy1dZrpcKQGPQqNAdHE3PXP/OJ0LnQZVFVYcfiX5tROVoe7IbXZN1+AOS1C1HQPNBj9g0v+F73KyMVPXKtmUiQUkmLw5QOgPSIgkOQdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452404; c=relaxed/simple;
	bh=aMz1d6Vr6AUVdVr99CWm107K6tcPGqW0cJAurqczDAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9pORdXG0u5BdWcG4Y1uDqlfrATFh8E/pZNQP34hRKcZGWYJRuQR0CUcXZWFQvrpmPR7qhx3+RhffCzw50XI8YVJBKNjP0P2OniMHoS4CK6b6EPtp7d0156bydfCSM+NYFHNglZnPp0EqFd+eBNU1lju+dyZ2xMi85Y0S8NFlYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TLH2EVzr; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TLH2EVzr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=0l8NQllIwpWwzE4pzZXGuQSdv4L5wX/F5Js5eRB28/k=; b=TLH2EVzroJAfj5O8e455LChE0O
	7sLququKhqiqr3qlqe8WGCdQPiPHfwMse55e7ZjKgmnm8f7YsIVnL25XjOo3/0TIttYkQcpTYKVMW
	nBmbT8xkDdIayQhXiOEBh9WNBtLnuoJEVqu8qPMxwJ4tG9xubcKjUzBiVeK8VnPeXs5J4gB8c5BLc
	q9WCNMJjmYgJ2TOCwzh9P/Y5GmgbvgBa/sV8sz6nTK45OhM3UpIMxegNYKYcnUalSBLRqkfL4GY5C
	+ZP+JrHZ98DKmNMJhkfuCmM4fbu/pbJ8HSeg1jKhSWtyyUJJ8pjgZdP7bgdbDbB1+4GHu40csDV/s
	BbLfeUTA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AAJ-0000000093E-2npt;
	Thu, 03 Sep 2026 16:19:51 +0000
Message-ID: <fca2f300-40d6-4e17-b060-c13a8d7ef2e9@infradead.org>
Date: Thu, 3 Sep 2026 09:19:50 -0700
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: dmaengine: Fix bracket
To: Manuel Ebner <manuelebnerli@mailbox.org>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260903095545.729607-3-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260903095545.729607-3-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/3/26 2:55 AM, Manuel Ebner wrote:
> Add missing ')' to sentence.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/driver-api/dmaengine/provider.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
> index f4ed98f70..22d235fb4 100644
> --- a/Documentation/driver-api/dmaengine/provider.rst
> +++ b/Documentation/driver-api/dmaengine/provider.rst
> @@ -321,7 +321,7 @@ to use.
>  - DESC_METADATA_CLIENT
>  
>    The metadata buffer is allocated/provided by the client driver and it is
> -  attached (via the dmaengine_desc_attach_metadata() helper to the descriptor.
> +  attached (via the dmaengine_desc_attach_metadata() helper) to the descriptor.
>  
>    From the DMA driver the following is expected for this mode:
>  

-- 
~Randy
