Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793849649;
	b=3gK9V3UC7QKeQ3pOSbKHteFov80ZvOyxvxrcXJsQD4dCZyYZh1BcdYr5slcigUjdah5z
	 lAifl/xVHLWv4u0QgY4vUQjsMd5HxvY4mhdYq/A1pF6f7Z/dEK1j0BBMXLl0GroSAfVhm
	 xnrrwscdyuvh8Mzz9+VcpilmBCJCl61krTkmf8ggRouAuwXRibEkxbkhYTyXRSDow0ZC3
	 2vkPXBDIVKFjKd/k59YddXZZ3R8ZyJaV4ApPhULFPWRvcy1rQMUPF+aFMaGT9q4Ll8f49
	 8N/cr72YgSCEUZYRUK6ITRNV42plo+RdRav6MEMmxceAFC/ievQo3N7JYKj0yVVR32w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849649;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kGtjkl+otQ69V077Z4O6I2ySUfE+CZb9D47hhkLq9X4=;
	b=KVs0uJbZacRRfptdryLyQXmgNeln/1SvM3oFiazlPChLf5+e2VRKjXUSRS/C/Zxp0a2/
	 8Pluo8pvPfAErUf48R+NOb8XyujZOX6W/8y1Q2BpWECbl6g4Ri4zL3HmdagTdZk5q5Gbo
	 5xSqhTqV7PD1Gw4N5PDPQsIjMZXIkIzHq208RZupwA+xB1MznW80A4FrpL0Xvp/gZvM+9
	 rvbKIvzp2/hi/+RAv0H/6EZCQrMkt13GZffEyKFjCAzH0mS2S4ajsam70Y/ALnWUq9O2v
	 JFhqQlP79JdF39W90WTUIZQcGTTdtUH54twGOYh7H9ZVApfkAhZMOZugDrv//hgIMIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ox+qqM5w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17B0606A31B;
	Thu,  5 Nov 2026 03:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ox+qqM5w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA391F00A02;
	Thu,  5 Nov 2026 03:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793849648;
	bh=kGtjkl+otQ69V077Z4O6I2ySUfE+CZb9D47hhkLq9X4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ox+qqM5wSZt8EO1+i/7coQBdaf6CKsy7zKndW/gX2mxDx0NvGx2a7kJRhzxjLG4qB
	 7CsP0capYqMz3zRIUUoJ0CzvcZT4gY0KSvXWDvhtCujNl1xY8fid7bZmDxWXBz4JOj
	 vObeWYqyuJIWeRhput5hvGZLK6TFDPoADkWULnpoO49Y9vTerv5Fpjhy9W52aDr8Xn
	 IS5t/zUj7qnwaQw2lKVV822xq/3CNY/AMQ64izgvYD19tKRQKjShpol3UTa4T7Zn1k
	 +Ph/YKEOHRk/5AxLg9YrSW1AJ+cqkJ2qtSJ8QG8aWEQfYW0iACVaka06Z0jZ6QC/Ui
	 lgKqqYO5T5sOg==
Date: Thu, 5 Nov 2026 09:04:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/34] dmaengine: migrate channel tasklets to WQ_BH
Message-ID: <auv5LFaju515uVLM@parshuram>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
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
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>

On 10-08-26, 11:09, Allen Pais wrote:
> Hi Arnd, Vinod and Frank,
> 
> This series moves DMAengine client completion bottom halves from private
> tasklets to a common per-channel API backed by WQ_BH.

Hey Allen,

Any update, I am looking to pick updated patchset for this. Can you post
v4?

-- 
~Vinod
