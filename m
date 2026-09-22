Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4B41CAAC
	for <dmaengine@vger.kernel.org>; Tue, 22 Sep 2026 01:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790039369; cv=none; b=EKlvfsFkjmeiNYjolVfRkSU8y+oI3PAzDbaF6wKog8Nmb2ZpZ/eRCJ20s6kujThv+zdYN/0GH2c7vUWB6wQbU+ITt7RxixuUQgsXIzeykiM6rkpASINbNL5LTGqRKbJh+zKVfSYVjSI06oMSuIPEiw1zoX0pGNxP1zWrgECfSnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790039369; c=relaxed/simple;
	bh=YAjh62Va+iIPhhhQYELlN8nBNsJI1Z1zLydubE1kySc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dQj7EHZ/NWOPbCbrCMhr8rl/xi1duIa5haYWcByhC9Q5GUZ9AGOVghMi3BElPI08X3wrPc6Tx4a0ntI7GI+mlJl8ddt2zvV372suS0U9I8LfsYN8WjiJqd/HmpL3HuKdSsq7ffPVsuVRgAhFYBwCMYbz2gI+bZ1HBQpglCl7WVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.159])
	by gateway (Coremail) with SMTP id _____8AxdvBF1bFqH3sOAA--.42359S3;
	Tue, 22 Sep 2026 09:09:25 +0800 (CST)
Received: from [10.161.0.102] (unknown [223.64.68.159])
	by front1 (Coremail) with SMTP id qMiowJAxmM1C1bFqo5AjAA--.9099S2;
	Tue, 22 Sep 2026 09:09:22 +0800 (CST)
Message-ID: <37b5eec8-6693-4410-9c4f-3cd3a8d87327@loongson.cn>
Date: Tue, 22 Sep 2026 09:09:21 +0800
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dmaengine: loongson: Remove the dev_dbg() output
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>
References: <20260921195745.gY25rf4P@linutronix.de>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <20260921195745.gY25rf4P@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxmM1C1bFqo5AjAA--.9099S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQESCGqwkHQbhgAAs5
X-Coremail-Antispam: 1Uk129KBj93XoW7Ar1fZFy3WFWDtr48uF18Xrc_yoW5Jr45pF
	ZrJ3yFkrs8Jr43Z3ZxGr48XFy5ZF1YgrZFgayxXws8ur98XwnF9r1fKa1jvFsrZrZrXr92
	qF95K3yjkF18ArgCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

Hi:

Thanks for your patch.

On 2026/9/22 03:57, Sebastian Andrzej Siewior wrote:
> The %pK format modifier was meant for /proc kind of output, not general
> printk output. Since commit ad67b74d2469d ("printk: hash addresses
> printed with %p") pointers are hashed by default and the behaviour can
> be controller by `hash_pointers' boot argument.
> The policy on %p is to not introduce new ones.
> 
> The output in loongson2_cmc_dma_issue_pending() is the only dev_dbg()
> output in the driver and is only output once the transfer is started.
> There is no output issued by the driver if the transfer is completed, if
> a follow-up transfer is started or if any of the other callbacks (such
> as loongson2_cmc_dma_tx_status()) are invoked. This output does not look
> essential.
> 
> Instead removing just the %pK output, remove the complete dev_dbg()
> output from the driver.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>

> ---
> v3…v4: https://lore.kernel.org/all/20260921151312.I8Q8NLnx@linutronix.de/
>    - Drop the braces now that there is a single statement left.
> 
> v2…v3: https://lore.kernel.org/all/20260918201714.eFNI3VMq@linutronix.de/
>    - Reword part of the commit message.
> 
> v1…v2: https://lore.kernel.org/all/20260918103409.UV4g2ON7@linutronix.de/
>    - Update subject line (it is removed, not replaced).
> 
>   drivers/dma/loongson/loongson2-apb-cmc-dma.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> index 1c9a542edc859..93727ae972ae2 100644
> --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> @@ -336,10 +336,8 @@ static void loongson2_cmc_dma_issue_pending(struct dma_chan *chan)
>   
>   	guard(spinlock_irqsave)(&lchan->vchan.lock);
>   
> -	if (vchan_issue_pending(&lchan->vchan) && !lchan->desc) {
> -		dev_dbg(chan2dev(lchan), "vchan %pK: issued\n", &lchan->vchan);
> +	if (vchan_issue_pending(&lchan->vchan) && !lchan->desc)
>   		loongson2_cmc_dma_start_transfer(lchan);
> -	}
>   }
>   
>   static int loongson2_cmc_dma_set_xfer_param(struct loongson2_cmc_dma_chan *lchan,

-- 
Thanks.
Binbin

